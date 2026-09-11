import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tutorial_card_model.dart';
export 'tutorial_card_model.dart';

class TutorialCardWidget extends StatefulWidget {
  const TutorialCardWidget({
    super.key,
    Color? cardBg,
    String? description,
    this.icon,
    double? rotation,
    Color? textColor,
    String? title,
    bool? buttonHidden,
  })  : this.cardBg = cardBg ?? const Color(0xFFF2F2F7),
        this.description = description ??
            'Swipe left or right to scroll through different words',
        this.rotation = rotation ?? 6.0,
        this.textColor = textColor ?? const Color(0x00000000),
        this.title = title ?? 'Thing',
        this.buttonHidden = buttonHidden ?? true;

  final Color cardBg;
  final String description;
  final Widget? icon;
  final double rotation;
  final Color textColor;
  final String title;
  final bool buttonHidden;

  @override
  State<TutorialCardWidget> createState() => _TutorialCardWidgetState();
}

class _TutorialCardWidgetState extends State<TutorialCardWidget> {
  late TutorialCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TutorialCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: valueOrDefault<double>(
            widget!.rotation,
            6.0,
          ) *
          (math.pi / 180),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 320.0,
        height: 400.0,
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            widget!.cardBg,
            Color(0xFFF2F2F7),
          ),
          borderRadius: BorderRadius.circular(24.0),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Container(
            child: Container(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  widget!.icon!,
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget!.title,
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Gendy',
                              color: valueOrDefault<Color>(
                                widget!.textColor,
                                FlutterFlowTheme.of(context).secondaryText,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              lineHeight: 1.3,
                            ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget!.description,
                          'Swipe left or right to scroll through different words',
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 4,
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'BlauerNue',
                              color: valueOrDefault<Color>(
                                widget!.textColor,
                                FlutterFlowTheme.of(context).secondaryText,
                              ),
                              letterSpacing: 0.0,
                              lineHeight: 0.9,
                            ),
                      ),
                    ].divide(SizedBox(height: 16.0)),
                  ),
                  if (!widget!.buttonHidden)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          FlutterFlowTheme.of(context).designToken.spacing.lg,
                          0.0,
                          0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'TUTORIAL_CARD_COMP_LETS_BEGIN_BTN_ON_TAP');
                          logFirebaseEvent('Button_dismiss_dialog');
                          Navigator.pop(context);
                        },
                        text: 'Let\'s Begin',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'BlauerNue',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ),
                ].divide(SizedBox(height: 24.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

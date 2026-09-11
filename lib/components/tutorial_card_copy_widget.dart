import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'dart:math' as math;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tutorial_card_copy_model.dart';
export 'tutorial_card_copy_model.dart';

class TutorialCardCopyWidget extends StatefulWidget {
  const TutorialCardCopyWidget({
    super.key,
    Color? cardBg,
    String? description,
    Color? textColor,
    String? title,
    bool? buttonHidden,
  })  : this.cardBg = cardBg ?? const Color(0xFFF2F2F7),
        this.description = description ??
            'Swipe left or right to scroll through different words',
        this.textColor = textColor ?? const Color(0x00000000),
        this.title = title ?? 'Thing',
        this.buttonHidden = buttonHidden ?? true;

  final Color cardBg;
  final String description;
  final Color textColor;
  final String title;
  final bool buttonHidden;

  @override
  State<TutorialCardCopyWidget> createState() => _TutorialCardCopyWidgetState();
}

class _TutorialCardCopyWidgetState extends State<TutorialCardCopyWidget> {
  late TutorialCardCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TutorialCardCopyModel());

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
      angle: 2.0 * (math.pi / 180),
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
        child: Container(
          child: Container(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/vnimc_1.png',
                    width: 75.0,
                    height: 75.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      widget!.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Gendy',
                                color: valueOrDefault<Color>(
                                  widget!.textColor,
                                  FlutterFlowTheme.of(context).secondaryText,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                lineHeight: 0.9,
                              ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Text(
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
                    ),
                  ].divide(SizedBox(height: 16.0)),
                ),
                if (!widget!.buttonHidden)
                  FFButtonWidget(
                    onPressed: true
                        ? null
                        : () async {
                            logFirebaseEvent(
                                'TUTORIAL_CARD_COPY_SWIPE_TO_BEGIN_BTN_ON');
                            logFirebaseEvent('Button_dismiss_dialog');
                            Navigator.pop(context);
                          },
                    text: 'Swipe to Begin',
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                      size: 24.0,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconAlignment: IconAlignment.end,
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconColor: FlutterFlowTheme.of(context).primary,
                      color: Colors.transparent,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily: 'BlauerNue',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                          ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    showLoadingIndicator: false,
                  ),
              ].divide(SizedBox(height: 24.0)),
            ),
          ),
        ),
      ),
    );
  }
}

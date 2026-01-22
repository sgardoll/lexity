import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'how_to_navigate_model.dart';
export 'how_to_navigate_model.dart';

class HowToNavigateWidget extends StatefulWidget {
  const HowToNavigateWidget({super.key});

  @override
  State<HowToNavigateWidget> createState() => _HowToNavigateWidgetState();
}

class _HowToNavigateWidgetState extends State<HowToNavigateWidget> {
  late HowToNavigateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HowToNavigateModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.4,

      decoration: BoxDecoration(),

      child: FlutterFlowSwipeableStack(
        onSwipeFn: (swipeableStackIndex) {},
        onLeftSwipe: (swipeableStackIndex) {},
        onRightSwipe: (swipeableStackIndex) {},
        onUpSwipe: (swipeableStackIndex) {},
        onDownSwipe: (swipeableStackIndex) {},
        itemBuilder: (context, index) {
          return [
            () => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Material(
                color: Colors.transparent,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).customColor2,

                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 2.0),
                      ),
                    ],

                    borderRadius: BorderRadius.circular(16.0),
                  ),

                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      24.0,
                      24.0,
                      24.0,
                      24.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Icon(
                          Icons.touch_app,
                          color: Color(0xC1FFFFFF),
                          size: 48.0,
                        ),
                        Text(
                          'Tap',
                          textAlign: TextAlign.center,

                          style: FlutterFlowTheme.of(context).headlineSmall
                              .override(
                                font: GoogleFonts.readexPro(
                                  fontWeight: FlutterFlowTheme.of(
                                    context,
                                  ).headlineSmall.fontWeight,
                                  fontStyle: FlutterFlowTheme.of(
                                    context,
                                  ).headlineSmall.fontStyle,
                                ),

                                color: FlutterFlowTheme.of(context).primaryText,

                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(
                                  context,
                                ).headlineSmall.fontWeight,
                                fontStyle: FlutterFlowTheme.of(
                                  context,
                                ).headlineSmall.fontStyle,
                              ),
                        ),
                        Text(
                          'Tap any word to hear it spoken and learn more about its meaning',
                          textAlign: TextAlign.center,

                          style: FlutterFlowTheme.of(context).bodyLarge
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(
                                    context,
                                  ).bodyLarge.fontWeight,
                                  fontStyle: FlutterFlowTheme.of(
                                    context,
                                  ).bodyLarge.fontStyle,
                                ),

                                color: FlutterFlowTheme.of(context).primaryText,

                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(
                                  context,
                                ).bodyLarge.fontWeight,
                                fontStyle: FlutterFlowTheme.of(
                                  context,
                                ).bodyLarge.fontStyle,
                              ),
                        ),
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ),
                ),
              ),
            ),
            () => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Material(
                color: Colors.transparent,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).customColor1,

                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 2.0),
                      ),
                    ],

                    borderRadius: BorderRadius.circular(16.0),
                  ),

                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      24.0,
                      24.0,
                      24.0,
                      24.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Icon(
                          Icons.pan_tool,
                          color: Color(0xBFFFFFFF),
                          size: 48.0,
                        ),
                        Text(
                          'Long Press',
                          textAlign: TextAlign.center,

                          style: FlutterFlowTheme.of(context).headlineSmall
                              .override(
                                font: GoogleFonts.readexPro(
                                  fontWeight: FlutterFlowTheme.of(
                                    context,
                                  ).headlineSmall.fontWeight,
                                  fontStyle: FlutterFlowTheme.of(
                                    context,
                                  ).headlineSmall.fontStyle,
                                ),

                                color: FlutterFlowTheme.of(context).primaryText,

                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(
                                  context,
                                ).headlineSmall.fontWeight,
                                fontStyle: FlutterFlowTheme.of(
                                  context,
                                ).headlineSmall.fontStyle,
                              ),
                        ),
                        Text(
                          'Long press to access settings and view your saved words',
                          textAlign: TextAlign.center,

                          style: FlutterFlowTheme.of(context).bodyLarge
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(
                                    context,
                                  ).bodyLarge.fontWeight,
                                  fontStyle: FlutterFlowTheme.of(
                                    context,
                                  ).bodyLarge.fontStyle,
                                ),

                                color: FlutterFlowTheme.of(context).primaryText,

                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(
                                  context,
                                ).bodyLarge.fontWeight,
                                fontStyle: FlutterFlowTheme.of(
                                  context,
                                ).bodyLarge.fontStyle,
                              ),
                        ),
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ),
                ),
              ),
            ),
            () => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Material(
                color: Colors.transparent,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).customColor5,

                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 2.0),
                      ),
                    ],

                    borderRadius: BorderRadius.circular(16.0),
                  ),

                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      24.0,
                      24.0,
                      24.0,
                      24.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Icon(Icons.swipe, color: Color(0xBFFFFFFF), size: 48.0),
                        Text(
                          'Swipe',
                          textAlign: TextAlign.center,

                          style: FlutterFlowTheme.of(context).headlineSmall
                              .override(
                                font: GoogleFonts.readexPro(
                                  fontWeight: FlutterFlowTheme.of(
                                    context,
                                  ).headlineSmall.fontWeight,
                                  fontStyle: FlutterFlowTheme.of(
                                    context,
                                  ).headlineSmall.fontStyle,
                                ),

                                color: FlutterFlowTheme.of(context).primaryText,

                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(
                                  context,
                                ).headlineSmall.fontWeight,
                                fontStyle: FlutterFlowTheme.of(
                                  context,
                                ).headlineSmall.fontStyle,
                              ),
                        ),
                        Text(
                          'Swipe left or right to scroll through different words',
                          textAlign: TextAlign.center,

                          style: FlutterFlowTheme.of(context).bodyLarge
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(
                                    context,
                                  ).bodyLarge.fontWeight,
                                  fontStyle: FlutterFlowTheme.of(
                                    context,
                                  ).bodyLarge.fontStyle,
                                ),

                                color: FlutterFlowTheme.of(context).primaryText,

                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(
                                  context,
                                ).bodyLarge.fontWeight,
                                fontStyle: FlutterFlowTheme.of(
                                  context,
                                ).bodyLarge.fontStyle,
                              ),
                        ),
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ),
                ),
              ),
            ),
            () => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).customColor4,

                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x33000000),
                      offset: Offset(0.0, 2.0),
                    ),
                  ],

                  borderRadius: BorderRadius.circular(16.0),
                ),

                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(48.0, 0.0, 48.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                              ),
                              unselectedWidgetColor: FlutterFlowTheme.of(
                                context,
                              ).accent2,
                            ),
                            child: Checkbox(
                              value: _model.checkboxValue ??= true,
                              onChanged: (newValue) async {
                                safeSetState(
                                  () => _model.checkboxValue = newValue!,
                                );
                              },
                              side:
                                  (FlutterFlowTheme.of(context).accent2 != null)
                                  ? BorderSide(
                                      width: 2,
                                      color: FlutterFlowTheme.of(
                                        context,
                                      ).accent2,
                                    )
                                  : null,
                              activeColor: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                          Text(
                            'Don\'t show this again',

                            style: FlutterFlowTheme.of(context).bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(
                                      context,
                                    ).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(
                                      context,
                                    ).bodyMedium.fontStyle,
                                  ),

                                  color: FlutterFlowTheme.of(context).alternate,

                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(
                                    context,
                                  ).bodyMedium.fontWeight,
                                  fontStyle: FlutterFlowTheme.of(
                                    context,
                                  ).bodyMedium.fontStyle,
                                ),
                          ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                            'HOW_TO_NAVIGATE_COMP_CLOSE_BTN_ON_TAP',
                          );
                          if (_model.checkboxValue!) {
                            logFirebaseEvent('Button_update_app_state');
                            FFAppState().showHowToNavigate = false;
                            safeSetState(() {});
                          }
                          logFirebaseEvent('Button_close_dialog_drawer_etc');
                          Navigator.pop(context);
                        },
                        text: 'Close',

                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 56.0,
                          padding: EdgeInsets.all(8.0),

                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                            0.0,
                            0.0,
                            0.0,
                            0.0,
                          ),

                          color: FlutterFlowTheme.of(context).alternate,
                          textStyle: FlutterFlowTheme.of(context).titleLarge
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(
                                    context,
                                  ).titleLarge.fontWeight,
                                  fontStyle: FlutterFlowTheme.of(
                                    context,
                                  ).titleLarge.fontStyle,
                                ),

                                color: FlutterFlowTheme.of(context).primaryText,

                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(
                                  context,
                                ).titleLarge.fontWeight,
                                fontStyle: FlutterFlowTheme.of(
                                  context,
                                ).titleLarge.fontStyle,
                              ),
                          elevation: 3.0,

                          borderRadius: BorderRadius.circular(28.0),
                        ),
                      ),
                    ].divide(SizedBox(height: 24.0)),
                  ),
                ),
              ),
            ),
          ][index]();
        },
        itemCount: 4,
        controller: _model.swipeableStackController,
        loop: false,
        cardDisplayCount: 3,
        scale: 0.9,

        maxAngle: 90.0,
      ),
    );
  }
}

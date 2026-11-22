import '/components/tutorial_card_widget.dart';
import '/components/tutorial_cardw_logo_widget.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'onboarding_tap_walkthrough_model.dart';
export 'onboarding_tap_walkthrough_model.dart';

class OnboardingTapWalkthroughWidget extends StatefulWidget {
  const OnboardingTapWalkthroughWidget({super.key});

  @override
  State<OnboardingTapWalkthroughWidget> createState() =>
      _OnboardingTapWalkthroughWidgetState();
}

class _OnboardingTapWalkthroughWidgetState
    extends State<OnboardingTapWalkthroughWidget> {
  late OnboardingTapWalkthroughModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingTapWalkthroughModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28.0),
      child: Container(
        width: 368.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).imageryNight,
          borderRadius: BorderRadius.circular(28.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).imageryLine,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 470.0,
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                      child: PageView(
                        controller: _model.pageViewController ??=
                            PageController(initialPage: 0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 12.0, 12.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    (FFMainAxisAlignment.start).flutterValue,
                                crossAxisAlignment:
                                    (FFCrossAxisAlignment.center).flutterValue,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 186.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .imageryTile,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            (FFMainAxisAlignment.start)
                                                .flutterValue,
                                        crossAxisAlignment:
                                            (FFCrossAxisAlignment.center)
                                                .flutterValue,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Expanded(
                                            child: Semantics(
                                              label: 'Petrichor in Watercolour',
                                              child: Image.asset(
                                                'assets/images/lexity-petrichor-watercolour.jpg',
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Semantics(
                                              label: 'Petrichor in Neon Noir',
                                              child: Image.asset(
                                                'assets/images/lexity-petrichor-neon-noir.jpg',
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Semantics(
                                              label: 'Petrichor in Paper Cut',
                                              child: Image.asset(
                                                'assets/images/lexity-petrichor-paper-cut.jpg',
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 3.0)),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: wrapWithModel(
                                      model: _model.tutorialCardwLogoModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: TutorialCardwLogoWidget(
                                        cardBg: FlutterFlowTheme.of(context)
                                            .imageryCream,
                                        description:
                                            'Here are some tips on how to navigate the app',
                                        textColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        title: 'Welcome to Lexity',
                                        buttonHidden: false,
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 12.0)),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 12.0, 12.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    (FFMainAxisAlignment.start).flutterValue,
                                crossAxisAlignment:
                                    (FFCrossAxisAlignment.center).flutterValue,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 186.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .imageryTile,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        children: [
                                          Semantics(
                                            label: 'Petrichor in Watercolour',
                                            child: Image.asset(
                                              'assets/images/lexity-petrichor-watercolour.jpg',
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                              alignment: Alignment(0.0, 0.0),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 1.0),
                                            child: Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .imageryOverlay,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 7.0, 12.0, 7.0),
                                                  child: Text(
                                                    'Watercolour',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'BlauerNue',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .imageryCream,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: wrapWithModel(
                                      model: _model.tutorialCardModel1,
                                      updateCallback: () => safeSetState(() {}),
                                      child: TutorialCardWidget(
                                        cardBg: FlutterFlowTheme.of(context)
                                            .imageryCream,
                                        description:
                                            'Swipe left or right to scroll through different words',
                                        icon: Icon(
                                          Icons.swipe_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 38.0,
                                        ),
                                        rotation: 0.0,
                                        textColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        title: 'Swipe',
                                        buttonHidden: true,
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 12.0)),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 12.0, 12.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    (FFMainAxisAlignment.start).flutterValue,
                                crossAxisAlignment:
                                    (FFCrossAxisAlignment.center).flutterValue,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 186.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .imageryTile,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        children: [
                                          Semantics(
                                            label: 'Petrichor in Neon Noir',
                                            child: Image.asset(
                                              'assets/images/lexity-petrichor-neon-noir.jpg',
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                              alignment: Alignment(0.0, 0.0),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 1.0),
                                            child: Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .imageryOverlay,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 7.0, 12.0, 7.0),
                                                  child: Text(
                                                    'Neon Noir',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'BlauerNue',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .imageryCream,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: wrapWithModel(
                                      model: _model.tutorialCardModel2,
                                      updateCallback: () => safeSetState(() {}),
                                      child: TutorialCardWidget(
                                        cardBg: FlutterFlowTheme.of(context)
                                            .imageryCream,
                                        description:
                                            'Tap any word to hear it spoken and learn more about its meaning',
                                        icon: Icon(
                                          Icons.touch_app_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 38.0,
                                        ),
                                        rotation: 0.0,
                                        textColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        title: 'Tap',
                                        buttonHidden: true,
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 12.0)),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 12.0, 12.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    (FFMainAxisAlignment.start).flutterValue,
                                crossAxisAlignment:
                                    (FFCrossAxisAlignment.center).flutterValue,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 186.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .imageryTile,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        children: [
                                          Semantics(
                                            label: 'Petrichor in Paper Cut',
                                            child: Image.asset(
                                              'assets/images/lexity-petrichor-paper-cut.jpg',
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                              alignment: Alignment(0.0, 0.0),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 1.0),
                                            child: Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .imageryOverlay,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 7.0, 12.0, 7.0),
                                                  child: Text(
                                                    'Paper Cut',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'BlauerNue',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .imageryCream,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: wrapWithModel(
                                      model: _model.tutorialCardModel3,
                                      updateCallback: () => safeSetState(() {}),
                                      child: TutorialCardWidget(
                                        cardBg: FlutterFlowTheme.of(context)
                                            .imageryCream,
                                        description:
                                            'Use Settings and Me in the bottom bar to change settings and view your saved words',
                                        icon: Icon(
                                          Icons.touch_app_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 38.0,
                                        ),
                                        rotation: 0.0,
                                        textColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        title: 'Navigate',
                                        buttonHidden: false,
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 12.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 11.0),
                        child: smooth_page_indicator.SmoothPageIndicator(
                          controller: _model.pageViewController ??=
                              PageController(initialPage: 0),
                          count: 4,
                          axisDirection: Axis.horizontal,
                          onDotClicked: (i) async {
                            await _model.pageViewController!.animateToPage(
                              i,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                            safeSetState(() {});
                          },
                          effect: smooth_page_indicator.SlideEffect(
                            spacing: 7.0,
                            radius: 8.0,
                            dotWidth: 7.0,
                            dotHeight: 7.0,
                            dotColor: FlutterFlowTheme.of(context).imageryLine,
                            activeDotColor:
                                FlutterFlowTheme.of(context).imageryMint,
                            paintStyle: PaintingStyle.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

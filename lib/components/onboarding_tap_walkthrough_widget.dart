import '/components/tutorial_card_copy_widget.dart';
import '/components/tutorial_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
    extends State<OnboardingTapWalkthroughWidget>
    with TickerProviderStateMixin {
  late OnboardingTapWalkthroughModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingTapWalkthroughModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          TintEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            color: FlutterFlowTheme.of(context).accent1,
            begin: 1.0,
            end: 0.3,
          ),
          RotateEffect(
            curve: Curves.easeInOutQuint,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: 0.02,
            end: 0.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          TintEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            color: FlutterFlowTheme.of(context).accent1,
            begin: 1.0,
            end: 0.3,
          ),
          RotateEffect(
            curve: Curves.easeInOutQuint,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: 0.1,
            end: 0.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          TintEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            color: FlutterFlowTheme.of(context).accent2,
            begin: 1.0,
            end: 0.3,
          ),
          RotateEffect(
            curve: Curves.easeInOutQuint,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: -0.1,
            end: 0.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          TintEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            color: FlutterFlowTheme.of(context).accent3,
            begin: 1.0,
            end: 0.3,
          ),
          RotateEffect(
            curve: Curves.easeInOutQuint,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: 0.2,
            end: 0.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 450.0,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                  child: PageView(
                    controller: _model.pageViewController ??=
                        PageController(initialPage: 0),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 30.0, 40.0, 20.0),
                          child: Container(
                            decoration: BoxDecoration(),
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: wrapWithModel(
                                model: _model.tutorialCardCopyModel,
                                updateCallback: () => safeSetState(() {}),
                                child: TutorialCardCopyWidget(
                                  cardBg: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  description:
                                      'Here are some tips on how to navigate the app',
                                  textColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  title: 'Welcome to Lexity',
                                  buttonHidden: false,
                                ),
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation1']!),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 10.0, 40.0, 30.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: wrapWithModel(
                              model: _model.tutorialCardModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: TutorialCardWidget(
                                cardBg: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                description:
                                    'Swipe left or right to scroll through different words',
                                icon: Icon(
                                  Icons.swipe_rounded,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 64.0,
                                ),
                                rotation: 6.0,
                                textColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                title: 'Swipe',
                                buttonHidden: true,
                              ),
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation2']!),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 30.0, 30.0, 20.0),
                          child: Container(
                            decoration: BoxDecoration(),
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(),
                                child: wrapWithModel(
                                  model: _model.tutorialCardModel2,
                                  updateCallback: () => safeSetState(() {}),
                                  child: TutorialCardWidget(
                                    cardBg: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    description:
                                        'Tap any word to hear it spoken and learn more about its meaning',
                                    icon: Icon(
                                      Icons.touch_app_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 64.0,
                                    ),
                                    rotation: 2.0,
                                    textColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    title: 'Tap',
                                    buttonHidden: true,
                                  ),
                                ),
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation3']!),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              30.0, 30.0, 40.0, 20.0),
                          child: Container(
                            decoration: BoxDecoration(),
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: wrapWithModel(
                                model: _model.tutorialCardModel3,
                                updateCallback: () => safeSetState(() {}),
                                child: TutorialCardWidget(
                                  cardBg: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  description:
                                      'Long press to access settings and view your saved words',
                                  icon: Icon(
                                    Icons.touch_app_rounded,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 64.0,
                                  ),
                                  rotation: -4.0,
                                  textColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  title: 'Long Press',
                                  buttonHidden: false,
                                ),
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation4']!),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
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
                        spacing: 8.0,
                        radius: 8.0,
                        dotWidth: 8.0,
                        dotHeight: 8.0,
                        dotColor: FlutterFlowTheme.of(context).accent4,
                        activeDotColor: FlutterFlowTheme.of(context).primary,
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
    );
  }
}

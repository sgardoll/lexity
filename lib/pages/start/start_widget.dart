import '/backend/backend.dart';
import '/cards/card_back/card_back_widget.dart';
import '/cards/front/front_widget.dart';
import '/components/blank/blank_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'start_model.dart';
export 'start_model.dart';

class StartWidget extends StatefulWidget {
  const StartWidget({
    super.key,
    this.id,
  });

  final String? id;

  static String routeName = 'start';
  static String routePath = 'start';

  @override
  State<StartWidget> createState() => _StartWidgetState();
}

class _StartWidgetState extends State<StartWidget>
    with TickerProviderStateMixin {
  late StartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'start'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('START_PAGE_start_ON_INIT_STATE');
      logFirebaseEvent('start_request_permissions');
      await requestPermission(notificationsPermission);
    });

    animationsMap.addAll({
      'swipeableStackOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          SaturateEffect(
            curve: Curves.easeInOutQuint,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'stackOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2100.0.ms,
            begin: Offset(0, 0),
            end: Offset(0, -0.349),
          ),
          TintEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2100.0.ms,
            color: Colors.black,
            begin: 0.0,
            end: 0.24,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 920.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(-50.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2400.0.ms,
            begin: 1.0,
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
            duration: 300.0.ms,
            begin: 0.0,
            end: 0.865,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<LexiconRecord>>(
      future: queryLexiconRecordOnce(
        queryBuilder: (lexiconRecord) =>
            lexiconRecord.orderBy('creationDate', descending: true),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryText,
            body: Center(
              child: SizedBox(
                width: 30.0,
                height: 30.0,
                child: SpinKitPulse(
                  color: FlutterFlowTheme.of(context).accent4,
                  size: 30.0,
                ),
              ),
            ),
          );
        }
        List<LexiconRecord> startLexiconRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryText,
            endDrawer: Container(
              width: MediaQuery.sizeOf(context).width * 0.3,
              child: Drawer(
                elevation: 0.0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.3,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(
                          color: Color(0x80000000),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 75.0, 0.0, 75.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderRadius: 100.0,
                                            buttonSize: 75.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            icon: Icon(
                                              Icons.favorite_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 35.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'START_PAGE_favorite_sharp_ICN_ON_TAP');
                                              logFirebaseEvent(
                                                  'IconButton_navigate_to');

                                              context.pushNamed(
                                                  LikedWidget.routeName);
                                            },
                                          ),
                                          Text(
                                            'Your Liked Words',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'BlauerNue',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 4.0)),
                                      ),
                                    ),
                                    Flexible(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 100.0,
                                            buttonSize: 75.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            icon: Icon(
                                              Icons.settings,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 35.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'START_PAGE_settings_ICN_ON_TAP');
                                              logFirebaseEvent(
                                                  'IconButton_navigate_to');

                                              context.pushNamed(
                                                  SettingsWidget.routeName);
                                            },
                                          ),
                                          Text(
                                            'Settings',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'BlauerNue',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 4.0)),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 40.0)),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 100.0,
                                    buttonSize: 75.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    icon: Icon(
                                      Icons.close_outlined,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 35.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'START_PAGE_close_outlined_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_widget_animation');
                                      if (animationsMap[
                                              'stackOnActionTriggerAnimation'] !=
                                          null) {
                                        await animationsMap[
                                                'stackOnActionTriggerAnimation']!
                                            .controller
                                            .reverse();
                                      }
                                      logFirebaseEvent('IconButton_drawer');
                                      if (scaffoldKey
                                              .currentState!.isDrawerOpen ||
                                          scaffoldKey
                                              .currentState!.isEndDrawerOpen) {
                                        Navigator.pop(context);
                                      }
                                    },
                                  ),
                                  Text(
                                    'Close',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'BlauerNue',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 4.0)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: Stack(
              children: [
                Builder(
                  builder: (context) {
                    final lexicon = functions
                            .rotateLexiconToId(
                                startLexiconRecordList.toList(), widget!.id)
                            ?.toList() ??
                        [];
                    if (lexicon.isEmpty) {
                      return Center(
                        child: BlankWidget(),
                      );
                    }

                    return FlutterFlowSwipeableStack(
                      onSwipeFn: (lexiconIndex) async {
                        logFirebaseEvent(
                            'START_SwipeableStack_btxgacya_ON_WIDGET_');
                        final lexiconItem = lexicon[lexiconIndex];
                        logFirebaseEvent('SwipeableStack_haptic_feedback');
                        HapticFeedback.mediumImpact();
                        if (_model.frontOfCardShowing) {
                          logFirebaseEvent('SwipeableStack_update_page_state');
                          _model.previousBgColor = colorFromCssString(
                            lexicon[lexiconIndex]!.colours.lightMuted,
                            defaultColor: Colors.black,
                          );
                          _model.bgColor = colorFromCssString(
                            lexicon[lexiconIndex]!.colours.darkMuted,
                            defaultColor: Colors.black,
                          );
                          safeSetState(() {});
                        } else {
                          logFirebaseEvent('SwipeableStack_update_page_state');
                          _model.frontOfCardShowing =
                              !_model.frontOfCardShowing;
                          safeSetState(() {});
                          logFirebaseEvent('SwipeableStack_update_page_state');
                          _model.previousBgColor = colorFromCssString(
                            lexicon[lexiconIndex]!.colours.lightMuted,
                            defaultColor: Colors.black,
                          );
                          _model.bgColor = colorFromCssString(
                            lexicon[lexiconIndex]!.colours.darkMuted,
                            defaultColor: Colors.black,
                          );
                          _model.cardIndex = 0;
                          safeSetState(() {});
                          logFirebaseEvent('SwipeableStack_navigate_to');

                          context.goNamed(
                            StartWidget.routeName,
                            extra: <String, dynamic>{
                              '__transition_info__': TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                              ),
                            },
                          );
                        }
                      },
                      onLeftSwipe: (lexiconIndex) {},
                      onRightSwipe: (lexiconIndex) {},
                      onUpSwipe: (lexiconIndex) {},
                      onDownSwipe: (lexiconIndex) {},
                      itemBuilder: (context, lexiconIndex) {
                        final lexiconItem = lexicon[lexiconIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onLongPress: () async {
                            logFirebaseEvent(
                                'START_PAGE_StackTilt_ON_LONG_PRESS');
                            logFirebaseEvent('StackTilt_haptic_feedback');
                            HapticFeedback.heavyImpact();
                            logFirebaseEvent('StackTilt_widget_animation');
                            if (animationsMap[
                                    'stackOnActionTriggerAnimation'] !=
                                null) {
                              animationsMap['stackOnActionTriggerAnimation']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            logFirebaseEvent('StackTilt_drawer');
                            scaffoldKey.currentState!.openEndDrawer();
                          },
                          child: Stack(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            children: [
                              AnimatedContainer(
                                duration: Duration(milliseconds: 600),
                                curve: Curves.easeInOutQuint,
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    _model.bgColor,
                                    FlutterFlowTheme.of(context).tertiary,
                                  ),
                                  border: Border.all(
                                    color: Colors.transparent,
                                    width: 0.0,
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation1']!),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 600),
                                curve: Curves.easeInOutQuint,
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    _model.previousBgColor,
                                    FlutterFlowTheme.of(context).success,
                                  ),
                                  border: Border.all(
                                    color: Colors.transparent,
                                    width: 0.0,
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation2']!),
                              if (!valueOrDefault<bool>(
                                _model.frontOfCardShowing,
                                false,
                              ))
                                wrapWithModel(
                                  model: _model.cardBackModels.getModel(
                                    lexiconItem.reference.id,
                                    lexiconIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: CardBackWidget(
                                    key: Key(
                                      'Keyqdu_${lexiconItem.reference.id}',
                                    ),
                                    doc: lexiconItem,
                                    turn: () async {
                                      logFirebaseEvent(
                                          'START_PAGE_Container_qduthaoz_CALLBACK');
                                      logFirebaseEvent(
                                          'CardBack_update_page_state');
                                      _model.frontOfCardShowing =
                                          !_model.frontOfCardShowing;
                                      safeSetState(() {});
                                    },
                                    backToTop: () async {
                                      logFirebaseEvent(
                                          'START_PAGE_Container_qduthaoz_CALLBACK');
                                      logFirebaseEvent('CardBack_navigate_to');
                                      if (Navigator.of(context).canPop()) {
                                        context.pop();
                                      }
                                      context.pushNamed(
                                        StartWidget.routeName,
                                        extra: <String, dynamic>{
                                          '__transition_info__': TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                          ),
                                        },
                                      );
                                    },
                                  ),
                                ),
                              if (valueOrDefault<bool>(
                                _model.frontOfCardShowing,
                                true,
                              ))
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.frontModels.getModel(
                                      lexiconItem.reference.id,
                                      lexiconIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    updateOnChange: true,
                                    child: FrontWidget(
                                      key: Key(
                                        'Keyv5h_${lexiconItem.reference.id}',
                                      ),
                                      mainShadow: valueOrDefault<String>(
                                        lexiconItem.term,
                                        'Acomiast',
                                      ),
                                      vibrantColour:
                                          lexiconItem.colours.vibrant,
                                      mainTextColour: valueOrDefault<String>(
                                        lexiconItem.colours.textColor,
                                        '#57636C',
                                      ),
                                      originTextColour:
                                          lexiconItem.colours.lightVibrant,
                                      parameter6: valueOrDefault<String>(
                                        lexiconItem.imageUrl,
                                        'https://www.connectio.com.au/lexily/01884dac-7c27-4acb-bd0b-eff481ca0ffe.png',
                                      ),
                                      parameter7: lexiconItem.pronunciation,
                                      parameter10: valueOrDefault<String>(
                                        lexiconItem.definition,
                                        'A person who does not take the time to rest or relax; a workaholic.',
                                      ),
                                      parameter11: valueOrDefault<String>(
                                        lexiconItem.language,
                                        'ENGLISH',
                                      ),
                                      doc: lexiconItem,
                                      blurhash: lexiconItem.blurhash,
                                      updateState: () async {
                                        logFirebaseEvent(
                                            'START_PAGE_Container_v5hiw0e0_CALLBACK');
                                        logFirebaseEvent(
                                            'Front_update_page_state');
                                        _model.frontOfCardShowing =
                                            !_model.frontOfCardShowing;
                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ).animateOnActionTrigger(
                          animationsMap['stackOnActionTriggerAnimation']!,
                        );
                      },
                      itemCount: lexicon.length,
                      controller: _model.swipeableStackController,
                      loop: true,
                      cardDisplayCount: 1,
                      scale: 0.9,
                      cardPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    ).animateOnPageLoad(
                        animationsMap['swipeableStackOnPageLoadAnimation']!);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

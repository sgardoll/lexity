import '/backend/backend.dart';
import '/cards/card_back/card_back_widget.dart';
import '/cards/front/front_widget.dart';
import '/components/blank/blank_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
            body: Container(
              width: double.infinity,
              child: Stack(
                children: [
                  Builder(
                    builder: (context) {
                      final lexicon = functions
                              .rotateLexiconToId(
                                  startLexiconRecordList.toList(), widget.id)
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
                            logFirebaseEvent(
                                'SwipeableStack_update_page_state');
                            _model.previousBgColor = colorFromCssString(
                              lexicon[lexiconIndex].colours.lightMuted,
                              defaultColor: Colors.black,
                            );
                            _model.bgColor = colorFromCssString(
                              lexicon[lexiconIndex].colours.darkMuted,
                              defaultColor: Colors.black,
                            );
                            safeSetState(() {});
                          } else {
                            logFirebaseEvent(
                                'SwipeableStack_update_page_state');
                            _model.frontOfCardShowing =
                                !_model.frontOfCardShowing;
                            safeSetState(() {});
                            logFirebaseEvent(
                                'SwipeableStack_update_page_state');
                            _model.previousBgColor = colorFromCssString(
                              lexicon[lexiconIndex].colours.lightMuted,
                              defaultColor: Colors.black,
                            );
                            _model.bgColor = colorFromCssString(
                              lexicon[lexiconIndex].colours.darkMuted,
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
                          return Stack(
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
                                      // Replace the current location — popping
                                      // first left pushNamed with a defunct
                                      // context when nothing was left to pop.
                                      context.goNamed(
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
          ),
        );
      },
    );
  }
}

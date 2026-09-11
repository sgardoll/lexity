import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'front_model.dart';
export 'front_model.dart';

class FrontWidget extends StatefulWidget {
  const FrontWidget({
    super.key,
    this.mainShadow,
    this.vibrantColour,
    this.mainTextColour,
    this.originTextColour,
    this.parameter6,
    this.parameter7,
    this.parameter10,
    this.parameter11,
    required this.updateState,
    required this.doc,
    String? blurhash,
  }) : this.blurhash = blurhash ?? 'UEK]}p\$P0KNd3sJ8vzof01xG?Hs,DgoeyEWB';

  /// Shadow colour for word heading and definition
  final String? mainShadow;

  /// Text colour for the pronounciation
  final String? vibrantColour;

  /// Used for the word and definition text colour
  final String? mainTextColour;

  /// Colour of the word's origin text
  final String? originTextColour;

  final String? parameter6;
  final String? parameter7;
  final String? parameter10;
  final String? parameter11;
  final Future Function()? updateState;
  final LexiconRecord? doc;
  final String blurhash;

  @override
  State<FrontWidget> createState() => _FrontWidgetState();
}

class _FrontWidgetState extends State<FrontWidget>
    with TickerProviderStateMixin {
  late FrontModel _model;

  var hasImageTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FrontModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FRONT_COMP_Front_ON_INIT_STATE');
      logFirebaseEvent('Front_widget_animation');
      if (animationsMap['containerOnActionTriggerAnimation2'] != null) {
        animationsMap['containerOnActionTriggerAnimation2']!
            .controller
            .forward(from: 0.0);
      }
      logFirebaseEvent('Front_widget_animation');
      if (animationsMap['imageOnActionTriggerAnimation'] != null) {
        safeSetState(() => hasImageTriggered = true);
        SchedulerBinding.instance.addPostFrameCallback((_) async =>
            animationsMap['imageOnActionTriggerAnimation']!
                .controller
                .forward(from: 0.0));
      }
      logFirebaseEvent('Front_widget_animation');
      if (animationsMap['textOnActionTriggerAnimation'] != null) {
        animationsMap['textOnActionTriggerAnimation']!
            .controller
            .forward(from: 0.0);
      }
      if (widget!.doc!.hasTermSpoken()) {
        logFirebaseEvent('Front_wait__delay');
        await Future.delayed(
          Duration(
            milliseconds: 2400,
          ),
        );
        logFirebaseEvent('Front_update_component_state');
        _model.soundPlaying = true;
        safeSetState(() {});
        logFirebaseEvent('Front_play_sound');
        _model.soundPlayer ??= AudioPlayer();
        if (_model.soundPlayer!.playing) {
          await _model.soundPlayer!.stop();
        }
        _model.soundPlayer!.setVolume(1.0);
        await _model.soundPlayer!
            .setUrl(widget!.doc!.termSpoken)
            .then((_) => _model.soundPlayer!.play());

        logFirebaseEvent('Front_update_component_state');
        _model.soundPlaying = false;
        safeSetState(() {});
      }
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 2000.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeIn,
            delay: 2000.0.ms,
            duration: 2000.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(2.0, 2.0),
          ),
          BlurEffect(
            curve: Curves.easeIn,
            delay: 2000.0.ms,
            duration: 2000.0.ms,
            begin: Offset(12.0, 12.0),
            end: Offset(100.0, 100.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          BlurEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(4.0, 4.0),
          ),
          TiltEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0, 0),
            end: Offset(0, 2.094),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          BlurEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 1200.0.ms,
            begin: Offset(4.0, 4.0),
            end: Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 300.0.ms,
            duration: 1200.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          BlurEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: Offset(8.0, 8.0),
            end: Offset(1.0, 1.0),
          ),
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
          TintEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            color: FlutterFlowTheme.of(context).primaryText,
            begin: 0.5,
            end: 1.0,
          ),
        ],
      ),
      'imageOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          SaturateEffect(
            curve: Curves.easeInOutQuint,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 2400.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          SaturateEffect(
            curve: Curves.easeInOutQuint,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 2400.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'textOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1800.0.ms,
            duration: 2400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1800.0.ms,
            duration: 2400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2400.0.ms,
            begin: 0.0,
            end: 1.0,
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
    // On component dispose action.
    () async {
      logFirebaseEvent('FRONT_COMP_Front_ON_DISPOSE');
      logFirebaseEvent('Front_widget_animation');
      if (animationsMap['containerOnActionTriggerAnimation1'] != null) {
        animationsMap['containerOnActionTriggerAnimation1']!.controller.stop();
      }
      logFirebaseEvent('Front_widget_animation');
      if (animationsMap['containerOnActionTriggerAnimation2'] != null) {
        animationsMap['containerOnActionTriggerAnimation2']!.controller.stop();
      }
      logFirebaseEvent('Front_widget_animation');
      if (animationsMap['imageOnActionTriggerAnimation'] != null) {
        animationsMap['imageOnActionTriggerAnimation']!.controller.stop();
      }
      logFirebaseEvent('Front_widget_animation');
      if (animationsMap['textOnActionTriggerAnimation'] != null) {
        animationsMap['textOnActionTriggerAnimation']!.controller.stop();
      }
      logFirebaseEvent('Front_widget_animation');
      if (animationsMap['containerOnActionTriggerAnimation1'] != null) {
        animationsMap['containerOnActionTriggerAnimation1']!.controller.reset();
      }
      logFirebaseEvent('Front_widget_animation');
      if (animationsMap['containerOnActionTriggerAnimation2'] != null) {
        animationsMap['containerOnActionTriggerAnimation2']!.controller.reset();
      }
      logFirebaseEvent('Front_widget_animation');
      if (animationsMap['imageOnActionTriggerAnimation'] != null) {
        animationsMap['imageOnActionTriggerAnimation']!.controller.reset();
      }
      logFirebaseEvent('Front_widget_animation');
      if (animationsMap['textOnActionTriggerAnimation'] != null) {
        animationsMap['textOnActionTriggerAnimation']!.controller.reset();
      }
    }();

    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            color: colorFromCssString(
              widget!.mainTextColour!,
              defaultColor: FlutterFlowTheme.of(context).accent1,
            ),
            border: Border.all(
              color: Colors.transparent,
              width: 0.0,
            ),
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('FRONT_COMP_CardFront_FirstTurn_ON_TAP');
            logFirebaseEvent('CardFront_FirstTurn_stop_sound');
            _model.soundPlayer?.stop();
            logFirebaseEvent('CardFront_FirstTurn_widget_animation');
            if (animationsMap['containerOnActionTriggerAnimation1'] != null) {
              await animationsMap['containerOnActionTriggerAnimation1']!
                  .controller
                  .forward(from: 0.0);
            }
            logFirebaseEvent('CardFront_FirstTurn_execute_callback');
            unawaited(
              () async {
                await widget.updateState?.call();
              }(),
            );
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.transparent,
                width: 0.0,
              ),
            ),
            child: Stack(
              alignment: AlignmentDirectional(0.0, 1.0),
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 53.0, 16.0, 48.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8.0,
                          color: colorFromCssString(
                            widget!.mainTextColour!,
                            defaultColor: Color(0x31000000),
                          ),
                          offset: Offset(
                            0.0,
                            0.0,
                          ),
                          spreadRadius: 2.0,
                        )
                      ],
                      gradient: LinearGradient(
                        colors: [
                          colorFromCssString(
                            widget!.originTextColour!,
                            defaultColor:
                                FlutterFlowTheme.of(context).alternate,
                          ),
                          colorFromCssString(
                            widget!.mainTextColour!,
                            defaultColor: Color(0x31000000),
                          )
                        ],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                      border: Border.all(
                        color: Colors.transparent,
                        width: 0.0,
                      ),
                    ),
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 36.0, 24.0, 0.0),
                      child: AutoSizeText(
                        widget!.mainShadow!,
                        maxLines: 1,
                        style:
                            FlutterFlowTheme.of(context).headlineLarge.override(
                                  fontFamily: 'Gendy',
                                  color: colorFromCssString(
                                    widget!.mainShadow!,
                                    defaultColor:
                                        FlutterFlowTheme.of(context).accent1,
                                  ),
                                  fontSize: 80.0,
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                  )
                      .animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation2']!)
                      .animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation2']!,
                      ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                  ),
                  child: Opacity(
                    opacity: 0.8,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0),
                        ),
                        child: OctoImage(
                          placeholderBuilder: (_) {
                            final blurHash = valueOrDefault<String>(
                              widget!.doc?.blurhash,
                              'U7KnrG.79Fj[k?%3%fof00Rjt7j[_4IUIUWB',
                            );

                            if (!validateBlurhash(blurHash)) {
                              return const SizedBox.shrink();
                            }
                            return SizedBox.expand(
                              child: Image(
                                image: BlurHashImage(blurHash),
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                          image: CachedNetworkImageProvider(
                            getCORSProxyUrl(
                              widget!.parameter6!,
                            ),
                          ),
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          fit: BoxFit.fitHeight,
                          alignment: Alignment(0.0, 1.0),
                        ),
                      )
                          .animateOnPageLoad(
                              animationsMap['imageOnPageLoadAnimation']!)
                          .animateOnActionTrigger(
                              animationsMap['imageOnActionTriggerAnimation']!,
                              hasBeenTriggered: hasImageTriggered),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 50.0, 16.0, 48.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(24.0),
                      border: Border.all(
                        color: Colors.transparent,
                        width: 0.0,
                      ),
                    ),
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 39.0, 24.0, 0.0),
                      child: SelectionArea(
                              child: AutoSizeText(
                        widget!.mainShadow!,
                        maxLines: 1,
                        style:
                            FlutterFlowTheme.of(context).headlineLarge.override(
                          fontFamily: 'Gendy',
                          color: colorFromCssString(
                            widget!.vibrantColour!,
                            defaultColor:
                                FlutterFlowTheme.of(context).alternate,
                          ),
                          fontSize: 80.0,
                          letterSpacing: 0.0,
                          shadows: [
                            Shadow(
                              color: colorFromCssString(
                                widget!.originTextColour!,
                                defaultColor:
                                    FlutterFlowTheme.of(context).primaryText,
                              ),
                              offset: Offset(2.0, 2.0),
                              blurRadius: 10.0,
                            ),
                            Shadow(
                              color: colorFromCssString(
                                widget!.originTextColour!,
                                defaultColor:
                                    FlutterFlowTheme.of(context).primaryText,
                              ),
                              offset: Offset(0.0, 0.0),
                              blurRadius: 36.0,
                            )
                          ],
                        ),
                      ))
                          .animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation']!)
                          .animateOnActionTrigger(
                            animationsMap['textOnActionTriggerAnimation']!,
                          ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(36.0, 200.0, 36.0, 66.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: AutoSizeText(
                            widget!.parameter7!,
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                              fontFamily: 'BlauerNue',
                              color: colorFromCssString(
                                widget!.mainTextColour!,
                                defaultColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                              fontSize: 20.0,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.normal,
                              shadows: [
                                Shadow(
                                  color: colorFromCssString(
                                    widget!.originTextColour!,
                                    defaultColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 2.0,
                                ),
                                Shadow(
                                  color: colorFromCssString(
                                    widget!.originTextColour!,
                                    defaultColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 50.0,
                                )
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 10,
                          child: Stack(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            children: [
                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: AutoSizeText(
                                  widget!.parameter10!,
                                  maxLines: 8,
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'BlauerNue',
                                        color: colorFromCssString(
                                          widget!.mainTextColour!,
                                          defaultColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                        ),
                                        fontSize: 20.0,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.w600,
                                        shadows: [
                                          Shadow(
                                            color: colorFromCssString(
                                              widget!.originTextColour!,
                                              defaultColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                            offset: Offset(1.0, 1.0),
                                            blurRadius: 4.0,
                                          ),
                                          Shadow(
                                            color: colorFromCssString(
                                              widget!.originTextColour!,
                                              defaultColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                            offset: Offset(0.0, 0.0),
                                            blurRadius: 26.0,
                                          )
                                        ],
                                        lineHeight: 0.9,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: AutoSizeText(
                            valueOrDefault<String>(
                              '(${widget!.parameter11})',
                              '(ENGLISH)',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                              fontFamily: 'BlauerNue',
                              color: colorFromCssString(
                                widget!.mainTextColour!,
                                defaultColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                              fontSize: 14.0,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w300,
                              shadows: [
                                Shadow(
                                  color: colorFromCssString(
                                    widget!.originTextColour!,
                                    defaultColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 2.0,
                                )
                              ],
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ).animateOnPageLoad(
                        animationsMap['columnOnPageLoadAnimation']!),
                  ),
                ),
              ],
            ),
          ),
        ).animateOnActionTrigger(
          animationsMap['containerOnActionTriggerAnimation1']!,
        ),
      ],
    );
  }
}

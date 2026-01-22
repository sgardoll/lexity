import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'front_model.dart';
export 'front_model.dart';

class FrontWidget extends StatefulWidget {
  const FrontWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
    this.parameter5,
    this.parameter6,
    this.parameter7,
    this.parameter8,
    this.parameter9,
    this.parameter10,
    this.parameter11,
    required this.updateState,
    required this.doc,
    String? blurhash,
  }) : this.blurhash = blurhash ?? 'UEK]}p\$P0KNd3sJ8vzof01xG?Hs,DgoeyEWB';

  final String? parameter1;
  final String? parameter2;
  final String? parameter3;
  final String? parameter4;
  final int? parameter5;
  final String? parameter6;
  final String? parameter7;
  final String? parameter8;
  final String? parameter9;
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
        animationsMap['containerOnActionTriggerAnimation2']!.controller.forward(
          from: 0.0,
        );
      }
      logFirebaseEvent('Front_widget_animation');
      if (animationsMap['imageOnActionTriggerAnimation'] != null) {
        safeSetState(() => hasImageTriggered = true);
        SchedulerBinding.instance.addPostFrameCallback(
          (_) async => animationsMap['imageOnActionTriggerAnimation']!
              .controller
              .forward(from: 0.0),
        );
      }
      logFirebaseEvent('Front_widget_animation');
      if (animationsMap['textOnActionTriggerAnimation'] != null) {
        animationsMap['textOnActionTriggerAnimation']!.controller.forward(
          from: 0.0,
        );
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
          BlurEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: Offset(4.0, 4.0),
            end: Offset(0.0, 0.0),
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
      animationsMap.values.where(
        (anim) =>
            anim.trigger == AnimationTrigger.onActionTrigger ||
            !anim.applyInitialState,
      ),
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
              widget.parameter3!,
              defaultColor: Colors.black,
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
            logFirebaseEvent('CardFront_FirstTurn_widget_animation');
            if (animationsMap['containerOnActionTriggerAnimation1'] != null) {
              await animationsMap['containerOnActionTriggerAnimation1']!
                  .controller
                  .forward(from: 0.0);
            }
            logFirebaseEvent('CardFront_FirstTurn_execute_callback');
            unawaited(() async {
              await widget.updateState?.call();
            }());
          },

          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,

            decoration: BoxDecoration(
              color: Colors.transparent,

              border: Border.all(color: Colors.transparent, width: 0.0),
            ),

            child: Stack(
              alignment: AlignmentDirectional(0.0, 1.0),
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    16.0,
                    80.0,
                    16.0,
                    48.0,
                  ),
                  child:
                      Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,

                            decoration: BoxDecoration(
                              color: colorFromCssString(
                                widget.parameter4!,
                                defaultColor: FlutterFlowTheme.of(
                                  context,
                                ).accent4,
                              ),

                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 8.0,
                                  color: colorFromCssString(
                                    widget.parameter3!,
                                    defaultColor: Color(0x31000000),
                                  ),
                                  offset: Offset(0.0, 0.0),
                                  spreadRadius: 2.0,
                                ),
                              ],

                              borderRadius: BorderRadius.circular(24.0),

                              border: Border.all(
                                color: Colors.transparent,
                                width: 0.0,
                              ),
                            ),

                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                24.0,
                                36.0,
                                24.0,
                                0.0,
                              ),
                              child: AutoSizeText(
                                widget.parameter1!,

                                maxLines: 1,

                                style: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                      fontFamily: 'Gendy',
                                      color: colorFromCssString(
                                        widget.parameter2!,
                                        defaultColor: FlutterFlowTheme.of(
                                          context,
                                        ).alternate,
                                      ),
                                      fontSize: 80.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          )
                          .animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation2']!,
                          )
                          .animateOnActionTrigger(
                            animationsMap['containerOnActionTriggerAnimation2']!,
                          ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,

                    border: Border.all(color: Colors.transparent, width: 0.0),
                  ),

                  child: Opacity(
                    opacity: 0.8,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        80.0,
                        0.0,
                        0.0,
                      ),
                      child:
                          ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(45.0),
                                  topRight: Radius.circular(45.0),
                                ),
                                child: OctoImage(
                                  placeholderBuilder: (_) => SizedBox.expand(
                                    child: Image(
                                      image: BlurHashImage(
                                        valueOrDefault<String>(
                                          widget.doc?.blurhash,
                                          'U7KnrG.79Fj[k?%3%fof00Rjt7j[_4IUIUWB',
                                        ),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  image: CachedNetworkImageProvider(
                                    getCORSProxyUrl(
                                      valueOrDefault<String>(
                                        widget.parameter6,
                                        'https://www.connectio.com.au/lexily/38981838-0ec6-4467-8cb1-da994ac285be.png',
                                      ),
                                    ),
                                  ),
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  fit: BoxFit.fitHeight,
                                  alignment: Alignment(0.0, 1.0),
                                ),
                              )
                              .animateOnPageLoad(
                                animationsMap['imageOnPageLoadAnimation']!,
                              )
                              .animateOnActionTrigger(
                                animationsMap['imageOnActionTriggerAnimation']!,
                                hasBeenTriggered: hasImageTriggered,
                              ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    16.0,
                    80.0,
                    16.0,
                    48.0,
                  ),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,

                    decoration: BoxDecoration(
                      color: Colors.transparent,

                      borderRadius: BorderRadius.circular(24.0),

                      border: Border.all(color: Colors.transparent, width: 0.0),
                    ),

                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                        24.0,
                        36.0,
                        24.0,
                        0.0,
                      ),
                      child:
                          SelectionArea(
                                child: AutoSizeText(
                                  widget.parameter1!,

                                  maxLines: 1,

                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                        fontFamily: 'Gendy',
                                        color: colorFromCssString(
                                          widget.parameter3!,
                                          defaultColor: FlutterFlowTheme.of(
                                            context,
                                          ).alternate,
                                        ),
                                        fontSize: 80.0,
                                        letterSpacing: 0.0,

                                        shadows: [
                                          Shadow(
                                            color: colorFromCssString(
                                              widget.parameter4!,
                                              defaultColor: FlutterFlowTheme.of(
                                                context,
                                              ).primaryText,
                                            ),
                                            offset: Offset(2.0, 2.0),
                                            blurRadius: 6.0,
                                          ),
                                        ],
                                      ),
                                ),
                              )
                              .animateOnPageLoad(
                                animationsMap['textOnPageLoadAnimation']!,
                              )
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

                    border: Border.all(color: Colors.transparent, width: 0.0),
                  ),

                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      36.0,
                      200.0,
                      36.0,
                      66.0,
                    ),
                    child:
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 1,
                              child: AutoSizeText(
                                widget.parameter7!,

                                style: FlutterFlowTheme.of(context).labelMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(
                                          context,
                                        ).labelMedium.fontStyle,
                                      ),

                                      color: colorFromCssString(
                                        widget.parameter4!,
                                        defaultColor: FlutterFlowTheme.of(
                                          context,
                                        ).alternate,
                                      ),
                                      fontSize: 20.0,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(
                                        context,
                                      ).labelMedium.fontStyle,

                                      shadows: [
                                        Shadow(
                                          color: colorFromCssString(
                                            widget.parameter3!,
                                            defaultColor: FlutterFlowTheme.of(
                                              context,
                                            ).primaryText,
                                          ),
                                          offset: Offset(1.0, 1.0),
                                          blurRadius: 2.0,
                                        ),
                                        Shadow(
                                          color: colorFromCssString(
                                            widget.parameter3!,
                                            defaultColor: FlutterFlowTheme.of(
                                              context,
                                            ).alternate,
                                          ),
                                          offset: Offset(0.0, 0.0),
                                          blurRadius: 50.0,
                                        ),
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
                                      widget.parameter10!,

                                      maxLines: 6,

                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'BlauerNue',
                                            color: colorFromCssString(
                                              widget.parameter3!,
                                              defaultColor: FlutterFlowTheme.of(
                                                context,
                                              ).alternate,
                                            ),
                                            fontSize: 30.0,
                                            letterSpacing: 0.5,
                                            fontWeight: FontWeight.w600,

                                            shadows: [
                                              Shadow(
                                                color: colorFromCssString(
                                                  widget.parameter4!,
                                                  defaultColor:
                                                      FlutterFlowTheme.of(
                                                        context,
                                                      ).primaryText,
                                                ),
                                                offset: Offset(2.0, 2.0),
                                                blurRadius: 2.0,
                                              ),
                                            ],
                                            lineHeight: 1.0,
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
                                  '(${widget.parameter11})',
                                  '(ENGLISH)',
                                ),

                                style: FlutterFlowTheme.of(context).labelMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FlutterFlowTheme.of(
                                          context,
                                        ).labelMedium.fontStyle,
                                      ),

                                      color: colorFromCssString(
                                        widget.parameter4!,
                                        defaultColor: FlutterFlowTheme.of(
                                          context,
                                        ).alternate,
                                      ),
                                      fontSize: 14.0,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FlutterFlowTheme.of(
                                        context,
                                      ).labelMedium.fontStyle,

                                      shadows: [
                                        Shadow(
                                          color: colorFromCssString(
                                            widget.parameter3!,
                                            defaultColor: FlutterFlowTheme.of(
                                              context,
                                            ).primaryText,
                                          ),
                                          offset: Offset(1.0, 1.0),
                                          blurRadius: 2.0,
                                        ),
                                      ],
                                    ),
                              ),
                            ),
                          ].divide(SizedBox(height: 12.0)),
                        ).animateOnPageLoad(
                          animationsMap['columnOnPageLoadAnimation']!,
                        ),
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

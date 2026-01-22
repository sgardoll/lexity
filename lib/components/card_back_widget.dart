import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:share_plus/share_plus.dart';
import 'card_back_model.dart';
export 'card_back_model.dart';

class CardBackWidget extends StatefulWidget {
  const CardBackWidget({
    super.key,
    required this.doc,
    required this.turn,
    required this.backToTop,
  });

  final LexiconRecord? doc;
  final Future Function()? turn;
  final Future Function()? backToTop;

  @override
  State<CardBackWidget> createState() => _CardBackWidgetState();
}

class _CardBackWidgetState extends State<CardBackWidget>
    with TickerProviderStateMixin {
  late CardBackModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardBackModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CARD_BACK_COMP_CardBack_ON_INIT_STATE');
      logFirebaseEvent('CardBack_update_component_state');
      _model.isLiked = valueOrDefault<bool>(
        widget.doc!.likedBy.contains(currentUserReference) ? true : false,
        false,
      );
      safeSetState(() {});
      logFirebaseEvent('CardBack_update_component_state');
      _model.soundPlaying = true;
      safeSetState(() {});
      logFirebaseEvent('CardBack_play_sound');
      _model.soundPlayer1 ??= AudioPlayer();
      if (_model.soundPlayer1!.playing) {
        await _model.soundPlayer1!.stop();
      }
      _model.soundPlayer1!.setVolume(1.0);
      await _model.soundPlayer1!
          .setUrl(widget.doc!.usageSpoken)
          .then((_) => _model.soundPlayer1!.play());

      logFirebaseEvent('CardBack_update_component_state');
      _model.soundPlaying = false;
      safeSetState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 3,
    )..addListener(() => safeSetState(() {}));

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
          BlurEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 750.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(12.0, 12.0),
          ),
          TiltEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0, 0),
            end: Offset(0, 2.094),
          ),
          ScaleEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 450.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(0.5, 0.5),
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          BlurEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 900.0.ms,
            begin: Offset(4.0, 4.0),
            end: Offset(0.0, 0.0),
          ),
          TiltEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 900.0.ms,
            begin: Offset(0, 2.094),
            end: Offset(-0.105, 6.283),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,

        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,

        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          BlurEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(12.0, 12.0),
            end: Offset(0.0, 0.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -100.0),
            end: Offset(0.0, 0.0),
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
      logFirebaseEvent('CARD_BACK_COMP_CardBack_ON_DISPOSE');
      logFirebaseEvent('CardBack_stop_sound');
      _model.soundPlayer1?.stop();
    }();

    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
      child: SafeArea(
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,

          decoration: BoxDecoration(),

          child: Stack(
            alignment: AlignmentDirectional(0.0, -1.0),
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 80.0, 16.0, 48.0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 6.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,

                      decoration: BoxDecoration(
                        color: colorFromCssString(
                          widget.doc!.colours.lightVibrant,
                          defaultColor: FlutterFlowTheme.of(context).accent4,
                        ),

                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8.0,
                            color: colorFromCssString(
                              widget.doc!.colours.darkVibrant,
                              defaultColor: Color(0x31000000),
                            ),
                            offset: Offset(0.0, 0.0),
                            spreadRadius: 4.0,
                          ),
                        ],

                        borderRadius: BorderRadius.circular(24.0),

                        border: Border.all(
                          color: Colors.transparent,
                          width: 0.0,
                        ),
                      ),

                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),

                        child: Stack(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                0.0,
                                24.0,
                                0.0,
                                100.0,
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                    'CARD_BACK_COMP_Column_iievell2_ON_TAP',
                                  );
                                  logFirebaseEvent('Column_widget_animation');
                                  if (animationsMap['containerOnActionTriggerAnimation'] !=
                                      null) {
                                    await animationsMap['containerOnActionTriggerAnimation']!
                                        .controller
                                        .forward(from: 0.0);
                                  }
                                  logFirebaseEvent('Column_execute_callback');
                                  await widget.turn?.call();
                                },

                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,

                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,

                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                  24.0,
                                                  0.0,
                                                  24.0,
                                                  0.0,
                                                ),
                                            child: AutoSizeText(
                                              valueOrDefault<String>(
                                                widget.doc?.term,
                                                '-',
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,

                                              style:
                                                  FlutterFlowTheme.of(
                                                    context,
                                                  ).headlineMedium.override(
                                                    fontFamily: 'Gendy',

                                                    fontSize: 35.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            '${widget.doc?.pronunciation}  |  ${widget.doc?.language}',
                                            textAlign: TextAlign.center,

                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                          context,
                                                        ).bodyMedium.fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                          context,
                                                        ).bodyMedium.fontStyle,
                                                  ),

                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                        context,
                                                      ).bodyMedium.fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                        context,
                                                      ).bodyMedium.fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                            1.0,
                                        child: Stack(
                                          alignment: AlignmentDirectional(
                                            0.0,
                                            -1.0,
                                          ),
                                          children: [
                                            Container(
                                              height: 50.0,

                                              decoration: BoxDecoration(),

                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Flexible(
                                                    child: Opacity(
                                                      opacity: 0.4,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional.fromSTEB(
                                                              20.0,
                                                              0.0,
                                                              0.0,
                                                              0.0,
                                                            ),
                                                        child: Text(
                                                          '\" ',

                                                          style:
                                                              FlutterFlowTheme.of(
                                                                context,
                                                              ).bodyMedium.override(
                                                                fontFamily:
                                                                    'PinkSunset',
                                                                color: colorFromCssString(
                                                                  widget
                                                                      .doc!
                                                                      .colours
                                                                      .muted,
                                                                  defaultColor:
                                                                      Colors
                                                                          .black,
                                                                ),
                                                                fontSize: 80.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Opacity(
                                                      opacity: 0.4,
                                                      child: Text(
                                                        '\" ',

                                                        style:
                                                            FlutterFlowTheme.of(
                                                              context,
                                                            ).bodyMedium.override(
                                                              fontFamily:
                                                                  'PinkSunset',
                                                              color: colorFromCssString(
                                                                widget
                                                                    .doc!
                                                                    .colours
                                                                    .muted,
                                                                defaultColor:
                                                                    Colors
                                                                        .black,
                                                              ),
                                                              fontSize: 80.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsetsDirectional.fromSTEB(
                                                    24.0,
                                                    24.0,
                                                    24.0,
                                                    0.0,
                                                  ),
                                              child: AutoSizeText(
                                                valueOrDefault<String>(
                                                  widget.doc?.usage,
                                                  '-',
                                                ),
                                                textAlign: TextAlign.center,
                                                maxLines: 6,

                                                style:
                                                    FlutterFlowTheme.of(
                                                      context,
                                                    ).headlineMedium.override(
                                                      fontFamily: 'Gendy',
                                                      color: colorFromCssString(
                                                        widget
                                                            .doc!
                                                            .colours
                                                            .vibrant,
                                                        defaultColor:
                                                            Colors.black,
                                                      ),
                                                      fontSize: 50.0,
                                                      letterSpacing: 0.0,

                                                      shadows: [
                                                        Shadow(
                                                          color: colorFromCssString(
                                                            widget
                                                                .doc!
                                                                .colours
                                                                .lightVibrant,
                                                            defaultColor:
                                                                FlutterFlowTheme.of(
                                                                  context,
                                                                ).accent4,
                                                          ),
                                                          offset: Offset(
                                                            2.0,
                                                            2.0,
                                                          ),
                                                          blurRadius: 2.0,
                                                        ),
                                                      ],
                                                      lineHeight: 0.0,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 2,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0,
                                          0.0,
                                          12.0,
                                          0.0,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,

                                          children: [
                                            Flexible(
                                              flex: 2,
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 2.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        8.0,
                                                      ),
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                      context,
                                                    ).primaryBackground,

                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8.0,
                                                        ),

                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                            context,
                                                          ).accent1,
                                                      width: 2.0,
                                                    ),
                                                  ),

                                                  child: Column(
                                                    children: [
                                                      Align(
                                                        alignment: Alignment(
                                                          -1.0,
                                                          0,
                                                        ),
                                                        child: TabBar(
                                                          labelColor:
                                                              FlutterFlowTheme.of(
                                                                context,
                                                              ).primaryText,
                                                          unselectedLabelColor:
                                                              colorFromCssString(
                                                                widget
                                                                    .doc!
                                                                    .colours
                                                                    .lightMuted,
                                                                defaultColor:
                                                                    Colors
                                                                        .black,
                                                              ),
                                                          labelPadding:
                                                              EdgeInsetsDirectional.fromSTEB(
                                                                8.0,
                                                                0.0,
                                                                8.0,
                                                                0.0,
                                                              ),
                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                            font: GoogleFonts.inter(
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                        context,
                                                                      )
                                                                      .labelMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                        context,
                                                                      )
                                                                      .labelMedium
                                                                      .fontStyle,
                                                            ),

                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                      context,
                                                                    )
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                      context,
                                                                    )
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          unselectedLabelStyle:
                                                              FlutterFlowTheme.of(
                                                                context,
                                                              ).labelMedium.override(
                                                                font: GoogleFonts.inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(
                                                                        context,
                                                                      ).labelMedium.fontStyle,
                                                                ),

                                                                fontSize: 11.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(
                                                                          context,
                                                                        )
                                                                        .labelMedium
                                                                        .fontStyle,
                                                              ),
                                                          indicatorColor:
                                                              colorFromCssString(
                                                                widget
                                                                    .doc!
                                                                    .colours
                                                                    .vibrant,
                                                                defaultColor:
                                                                    FlutterFlowTheme.of(
                                                                      context,
                                                                    ).secondaryText,
                                                              ),
                                                          indicatorWeight: 2.0,

                                                          tabs: [
                                                            Tab(
                                                              text: 'Related',
                                                            ),
                                                            Tab(
                                                              text: 'Synonyms',
                                                            ),
                                                            Tab(
                                                              text: 'Antonyms',
                                                            ),
                                                            Tab(
                                                              text: 'Etymology',
                                                            ),
                                                          ],
                                                          controller: _model
                                                              .tabBarController,
                                                          onTap: (i) async {
                                                            [
                                                              () async {},
                                                              () async {},
                                                              () async {},
                                                              () async {},
                                                            ][i]();
                                                          },
                                                        ),
                                                      ),

                                                      Expanded(
                                                        child: TabBarView(
                                                          controller: _model
                                                              .tabBarController,

                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional.fromSTEB(
                                                                    12.0,
                                                                    12.0,
                                                                    12.0,
                                                                    12.0,
                                                                  ),
                                                              child: Builder(
                                                                builder: (context) {
                                                                  final related =
                                                                      widget
                                                                          .doc
                                                                          ?.relatedWords
                                                                          .toList() ??
                                                                      [];

                                                                  return Wrap(
                                                                    spacing:
                                                                        12.0,
                                                                    runSpacing:
                                                                        12.0,
                                                                    alignment:
                                                                        WrapAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        WrapCrossAlignment
                                                                            .start,
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    runAlignment:
                                                                        WrapAlignment
                                                                            .center,
                                                                    verticalDirection:
                                                                        VerticalDirection
                                                                            .down,
                                                                    clipBehavior:
                                                                        Clip.none,
                                                                    children: List.generate(
                                                                      related
                                                                          .length,
                                                                      (
                                                                        relatedIndex,
                                                                      ) {
                                                                        final relatedItem =
                                                                            related[relatedIndex];
                                                                        return Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              2.0,
                                                                          shape: RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(
                                                                              8.0,
                                                                            ),
                                                                          ),
                                                                          child: Container(
                                                                            decoration: BoxDecoration(
                                                                              color: colorFromCssString(
                                                                                widget.doc!.colours.vibrant,
                                                                                defaultColor: FlutterFlowTheme.of(
                                                                                  context,
                                                                                ).info,
                                                                              ),

                                                                              borderRadius: BorderRadius.circular(
                                                                                8.0,
                                                                              ),
                                                                            ),

                                                                            child: Padding(
                                                                              padding: EdgeInsets.all(
                                                                                8.0,
                                                                              ),
                                                                              child: AutoSizeText(
                                                                                relatedItem,
                                                                                textAlign: TextAlign.center,
                                                                                maxLines: 4,

                                                                                style:
                                                                                    FlutterFlowTheme.of(
                                                                                      context,
                                                                                    ).bodyMedium.override(
                                                                                      fontFamily: 'Gendy',

                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional.fromSTEB(
                                                                    12.0,
                                                                    12.0,
                                                                    12.0,
                                                                    12.0,
                                                                  ),
                                                              child: Builder(
                                                                builder: (context) {
                                                                  final syn =
                                                                      widget
                                                                          .doc
                                                                          ?.synonyms
                                                                          .toList() ??
                                                                      [];

                                                                  return Wrap(
                                                                    spacing:
                                                                        12.0,
                                                                    runSpacing:
                                                                        12.0,
                                                                    alignment:
                                                                        WrapAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        WrapCrossAlignment
                                                                            .center,
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    runAlignment:
                                                                        WrapAlignment
                                                                            .center,
                                                                    verticalDirection:
                                                                        VerticalDirection
                                                                            .down,
                                                                    clipBehavior:
                                                                        Clip.none,
                                                                    children: List.generate(
                                                                      syn.length,
                                                                      (
                                                                        synIndex,
                                                                      ) {
                                                                        final synItem =
                                                                            syn[synIndex];
                                                                        return Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              1.0,
                                                                          shape: RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(
                                                                              8.0,
                                                                            ),
                                                                          ),
                                                                          child: Container(
                                                                            decoration: BoxDecoration(
                                                                              color: colorFromCssString(
                                                                                widget.doc!.colours.vibrant,
                                                                                defaultColor: FlutterFlowTheme.of(
                                                                                  context,
                                                                                ).info,
                                                                              ),

                                                                              borderRadius: BorderRadius.circular(
                                                                                8.0,
                                                                              ),
                                                                            ),

                                                                            child: Padding(
                                                                              padding: EdgeInsets.all(
                                                                                8.0,
                                                                              ),
                                                                              child: AutoSizeText(
                                                                                synItem,
                                                                                textAlign: TextAlign.center,
                                                                                maxLines: 4,

                                                                                style:
                                                                                    FlutterFlowTheme.of(
                                                                                      context,
                                                                                    ).bodyMedium.override(
                                                                                      fontFamily: 'Gendy',

                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional.fromSTEB(
                                                                    12.0,
                                                                    12.0,
                                                                    12.0,
                                                                    12.0,
                                                                  ),
                                                              child: Builder(
                                                                builder: (context) {
                                                                  final ant =
                                                                      widget
                                                                          .doc
                                                                          ?.antonyms
                                                                          .toList() ??
                                                                      [];

                                                                  return Wrap(
                                                                    spacing:
                                                                        12.0,
                                                                    runSpacing:
                                                                        12.0,
                                                                    alignment:
                                                                        WrapAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        WrapCrossAlignment
                                                                            .start,
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    runAlignment:
                                                                        WrapAlignment
                                                                            .center,
                                                                    verticalDirection:
                                                                        VerticalDirection
                                                                            .down,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    children: List.generate(
                                                                      ant.length,
                                                                      (
                                                                        antIndex,
                                                                      ) {
                                                                        final antItem =
                                                                            ant[antIndex];
                                                                        return Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              2.0,
                                                                          shape: RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(
                                                                              8.0,
                                                                            ),
                                                                          ),
                                                                          child: Container(
                                                                            decoration: BoxDecoration(
                                                                              color: colorFromCssString(
                                                                                widget.doc!.colours.vibrant,
                                                                                defaultColor: FlutterFlowTheme.of(
                                                                                  context,
                                                                                ).info,
                                                                              ),

                                                                              borderRadius: BorderRadius.circular(
                                                                                8.0,
                                                                              ),
                                                                            ),

                                                                            child: Padding(
                                                                              padding: EdgeInsets.all(
                                                                                8.0,
                                                                              ),
                                                                              child: AutoSizeText(
                                                                                antItem,
                                                                                textAlign: TextAlign.center,
                                                                                maxLines: 4,

                                                                                style:
                                                                                    FlutterFlowTheme.of(
                                                                                      context,
                                                                                    ).bodyMedium.override(
                                                                                      fontFamily: 'Gendy',

                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),

                                                              child: SingleChildScrollView(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,

                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                            12.0,
                                                                          ),
                                                                      child: SelectionArea(
                                                                        child: Text(
                                                                          valueOrDefault<
                                                                            String
                                                                          >(
                                                                            widget.doc?.etymology,
                                                                            '-',
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,

                                                                          style:
                                                                              FlutterFlowTheme.of(
                                                                                context,
                                                                              ).bodyMedium.override(
                                                                                fontFamily: 'Gendy',

                                                                                fontSize: 20.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,

                                                                                lineHeight: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
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
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,

                                        children: [
                                          Text(
                                            'Rarity Score:',
                                            textAlign: TextAlign.center,

                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                          context,
                                                        ).bodyMedium.fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                          context,
                                                        ).bodyMedium.fontStyle,
                                                  ),

                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                        context,
                                                      ).bodyMedium.fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                        context,
                                                      ).bodyMedium.fontStyle,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,

                                            children: [
                                              Flexible(
                                                flex: 3,
                                                child: Padding(
                                                  padding:
                                                      EdgeInsetsDirectional.fromSTEB(
                                                        24.0,
                                                        0.0,
                                                        8.0,
                                                        0.0,
                                                      ),
                                                  child: Slider(
                                                    activeColor:
                                                        colorFromCssString(
                                                          widget
                                                              .doc!
                                                              .colours
                                                              .darkVibrant,
                                                          defaultColor:
                                                              FlutterFlowTheme.of(
                                                                context,
                                                              ).alternate,
                                                        ),
                                                    inactiveColor:
                                                        colorFromCssString(
                                                          widget
                                                              .doc!
                                                              .colours
                                                              .vibrant,
                                                          defaultColor:
                                                              FlutterFlowTheme.of(
                                                                context,
                                                              ).alternate,
                                                        ),
                                                    min: 0.0,
                                                    max: 10.0,
                                                    value:
                                                        _model.sliderValue ??=
                                                            valueOrDefault<
                                                              double
                                                            >(
                                                              widget
                                                                  .doc
                                                                  ?.rarityScore,
                                                              0.0,
                                                            ),
                                                    label: _model.sliderValue
                                                        ?.toString(),
                                                    divisions: 10,
                                                    onChanged: true
                                                        ? null
                                                        : (newValue) {
                                                            safeSetState(
                                                              () =>
                                                                  _model.sliderValue =
                                                                      newValue,
                                                            );
                                                          },
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                      0.0,
                                                      0.0,
                                                      24.0,
                                                      0.0,
                                                    ),
                                                child: AutoSizeText(
                                                  valueOrDefault<String>(
                                                    widget.doc?.rarityScore
                                                        .toString(),
                                                    '0',
                                                  ),

                                                  maxLines: 1,

                                                  style:
                                                      FlutterFlowTheme.of(
                                                        context,
                                                      ).labelLarge.override(
                                                        fontFamily: 'Gendy',
                                                        color:
                                                            colorFromCssString(
                                                              widget
                                                                  .doc!
                                                                  .colours
                                                                  .vibrant,
                                                              defaultColor:
                                                                  Colors.black,
                                                            ),
                                                        fontSize: 40.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 75.0,

                              decoration: BoxDecoration(
                                color: colorFromCssString(
                                  widget.doc!.colours.vibrant,
                                  defaultColor: FlutterFlowTheme.of(
                                    context,
                                  ).secondaryText,
                                ),

                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 6.0,
                                    color: colorFromCssString(
                                      widget.doc!.colours.darkVibrant,
                                      defaultColor: Color(0x31000000),
                                    ),
                                    offset: Offset(0.0, -4.0),
                                    spreadRadius: 2.0,
                                  ),
                                ],

                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(24.0),
                                  bottomRight: Radius.circular(24.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),

                                border: Border.all(
                                  color: Colors.transparent,
                                  width: 0.0,
                                ),
                              ),

                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,

                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                                      Builder(
                                        builder: (context) => FlutterFlowIconButton(
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,

                                          icon: Icon(
                                            Icons.share,
                                            color: FlutterFlowTheme.of(
                                              context,
                                            ).primaryText,
                                            size: 24.0,
                                          ),

                                          onPressed: () async {
                                            logFirebaseEvent(
                                              'CARD_BACK_COMP_share_ICN_ON_TAP',
                                            );
                                            logFirebaseEvent(
                                              'IconButton_backend_call',
                                            );
                                            unawaited(() async {
                                              await widget.doc!.reference.update(
                                                {
                                                  ...mapToFirestore({
                                                    'sharedBy':
                                                        FieldValue.arrayUnion([
                                                          currentUserReference,
                                                        ]),
                                                  }),
                                                },
                                              );
                                            }());
                                            logFirebaseEvent(
                                              'IconButton_share',
                                            );
                                            await Share.share(
                                              valueOrDefault<String>(
                                                'lexity://lexicon/Start/${widget.doc?.term}',
                                                'lexity://lexicon/Start',
                                              ),
                                              sharePositionOrigin:
                                                  getWidgetBoundingBox(context),
                                            );
                                          },
                                        ),
                                      ),
                                      Text(
                                        'Share',

                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FlutterFlowTheme.of(
                                                  context,
                                                ).labelSmall.fontStyle,
                                              ),

                                              color: FlutterFlowTheme.of(
                                                context,
                                              ).primaryText,

                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FlutterFlowTheme.of(
                                                context,
                                              ).labelSmall.fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                                      if (!valueOrDefault<bool>(
                                        _model.isLiked,
                                        true,
                                      ))
                                        Flexible(
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 46.0,

                                            icon: Icon(
                                              Icons.favorite_border,
                                              color: FlutterFlowTheme.of(
                                                context,
                                              ).primaryText,
                                              size: 24.0,
                                            ),

                                            onPressed: () async {
                                              logFirebaseEvent(
                                                'CARD_BACK_COMP_Like_ON_TAP',
                                              );
                                              logFirebaseEvent(
                                                'Like_update_component_state',
                                              );
                                              _model.isLiked = !_model.isLiked;
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                'Like_backend_call',
                                              );
                                              unawaited(() async {
                                                await widget.doc!.reference.update({
                                                  ...mapToFirestore({
                                                    'likedBy':
                                                        FieldValue.arrayUnion([
                                                          currentUserReference,
                                                        ]),
                                                  }),
                                                });
                                              }());
                                              logFirebaseEvent(
                                                'Like_show_snack_bar',
                                              );
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Liked',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                            context,
                                                          ).primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                    milliseconds: 4000,
                                                  ),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                        context,
                                                      ).secondary,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      if (valueOrDefault<bool>(
                                        _model.isLiked,
                                        false,
                                      ))
                                        Flexible(
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 46.0,

                                            icon: Icon(
                                              Icons.favorite,
                                              color: FlutterFlowTheme.of(
                                                context,
                                              ).primaryText,
                                              size: 24.0,
                                            ),

                                            onPressed: () async {
                                              logFirebaseEvent(
                                                'CARD_BACK_COMP_Remove_ON_TAP',
                                              );
                                              logFirebaseEvent(
                                                'Remove_update_component_state',
                                              );
                                              _model.isLiked = !_model.isLiked;
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                'Remove_backend_call',
                                              );
                                              unawaited(() async {
                                                await widget.doc!.reference.update({
                                                  ...mapToFirestore({
                                                    'likedBy':
                                                        FieldValue.arrayRemove([
                                                          currentUserReference,
                                                        ]),
                                                  }),
                                                });
                                              }());
                                              logFirebaseEvent(
                                                'Remove_show_snack_bar',
                                              );
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Removed from Likes',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                            context,
                                                          ).primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                    milliseconds: 4000,
                                                  ),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                        context,
                                                      ).secondary,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      Text(
                                        'Like',

                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FlutterFlowTheme.of(
                                                  context,
                                                ).labelSmall.fontStyle,
                                              ),

                                              color: FlutterFlowTheme.of(
                                                context,
                                              ).primaryText,

                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FlutterFlowTheme.of(
                                                context,
                                              ).labelSmall.fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                                      if (!_model.soundPlaying)
                                        Flexible(
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 46.0,

                                            icon: Icon(
                                              Icons.play_arrow_rounded,
                                              color: FlutterFlowTheme.of(
                                                context,
                                              ).primaryText,
                                              size: 24.0,
                                            ),

                                            onPressed: () async {
                                              logFirebaseEvent(
                                                'CARD_BACK_COMP_Play_ON_TAP',
                                              );
                                              logFirebaseEvent(
                                                'Play_update_component_state',
                                              );
                                              _model.soundPlaying = true;
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                'Play_play_sound',
                                              );
                                              _model.soundPlayer2 ??=
                                                  AudioPlayer();
                                              if (_model
                                                  .soundPlayer2!
                                                  .playing) {
                                                await _model.soundPlayer2!
                                                    .stop();
                                              }
                                              _model.soundPlayer2!.setVolume(
                                                1.0,
                                              );
                                              await _model.soundPlayer2!
                                                  .setUrl(
                                                    widget.doc!.usageSpoken,
                                                  )
                                                  .then(
                                                    (_) => _model.soundPlayer2!
                                                        .play(),
                                                  );

                                              logFirebaseEvent(
                                                'Play_update_component_state',
                                              );
                                              _model.soundPlaying = false;
                                              safeSetState(() {});
                                            },
                                          ),
                                        ),
                                      if (_model.soundPlaying)
                                        Flexible(
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 46.0,

                                            icon: Icon(
                                              Icons.stop_rounded,
                                              color: FlutterFlowTheme.of(
                                                context,
                                              ).primaryText,
                                              size: 24.0,
                                            ),

                                            onPressed: () async {
                                              logFirebaseEvent(
                                                'CARD_BACK_COMP_Stop_ON_TAP',
                                              );
                                              await Future.wait([
                                                Future(() async {
                                                  logFirebaseEvent(
                                                    'Stop_stop_sound',
                                                  );
                                                  _model.soundPlayer2?.stop();
                                                }),
                                                Future(() async {
                                                  logFirebaseEvent(
                                                    'Stop_stop_sound',
                                                  );
                                                  _model.soundPlayer1?.stop();
                                                }),
                                              ]);
                                              logFirebaseEvent(
                                                'Stop_update_component_state',
                                              );
                                              _model.soundPlaying = false;
                                              safeSetState(() {});
                                            },
                                          ),
                                        ),
                                      Text(
                                        'Play',

                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FlutterFlowTheme.of(
                                                  context,
                                                ).labelSmall.fontStyle,
                                              ),

                                              color: FlutterFlowTheme.of(
                                                context,
                                              ).primaryText,

                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FlutterFlowTheme.of(
                                                context,
                                              ).labelSmall.fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation2']!),
                    ),
                  ),
                ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!).animateOnActionTrigger(animationsMap['containerOnActionTriggerAnimation']!),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: colorFromCssString(
                      widget.doc!.colours.vibrant,
                      defaultColor: FlutterFlowTheme.of(context).secondaryText,
                    ),

                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 2.0),
                      ),
                    ],

                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24.0),
                      bottomRight: Radius.circular(24.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),

                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      15.0,
                      0.0,
                      16.0,
                      12.0,
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent('CARD_BACK_COMP_Row_yt7wmzp3_ON_TAP');
                        logFirebaseEvent('Row_execute_callback');
                        await widget.backToTop?.call();
                        logFirebaseEvent('Row_widget_animation');
                        if (animationsMap['containerOnActionTriggerAnimation'] !=
                            null) {
                          await animationsMap['containerOnActionTriggerAnimation']!
                              .controller
                              .forward(from: 0.0);
                        }
                      },

                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,

                            children: [
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 46.0,

                                icon: Icon(
                                  Icons.swipe_down,
                                  color: FlutterFlowTheme.of(
                                    context,
                                  ).primaryText,
                                  size: 24.0,
                                ),

                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                              Text(
                                'Back to Top',
                                textAlign: TextAlign.center,

                                style: FlutterFlowTheme.of(context).labelSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(
                                          context,
                                        ).labelSmall.fontStyle,
                                      ),

                                      color: FlutterFlowTheme.of(
                                        context,
                                      ).primaryText,

                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(
                                        context,
                                      ).labelSmall.fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation3']!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

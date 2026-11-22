import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'image_styles_model.dart';
export 'image_styles_model.dart';

/// Choose the imagery style for word cards: free default, a monthly Style
/// Pack of distinct styles, or a monthly custom style.
class ImageStylesWidget extends StatefulWidget {
  const ImageStylesWidget({super.key});

  static String routeName = 'imageStyles';
  static String routePath = 'image-styles';

  @override
  State<ImageStylesWidget> createState() => _ImageStylesWidgetState();
}

class _ImageStylesWidgetState extends State<ImageStylesWidget>
    with TickerProviderStateMixin {
  late ImageStylesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageStylesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'imageStyles'});
    _model.customStyleFieldTextController ??= TextEditingController();
    _model.customStyleFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 420.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 420.0.ms,
            begin: Offset(0.0, 12.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'pageViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 90.0.ms,
            duration: 640.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 90.0.ms,
            duration: 640.0.ms,
            begin: Offset(0.0, 16.0),
            end: Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 90.0.ms,
            duration: 640.0.ms,
            begin: Offset(0.98, 0.98),
            end: Offset(1.0, 1.0),
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).imageryNight,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).imageryNight,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
                  crossAxisAlignment: (FFCrossAxisAlignment.start).flutterValue,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment:
                          (FFMainAxisAlignment.start).flutterValue,
                      crossAxisAlignment:
                          (FFCrossAxisAlignment.center).flutterValue,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        MergeSemantics(
                            child: Semantics(
                          label: 'Back',
                          child: FlutterFlowIconButton(
                            borderRadius: 22.0,
                            buttonSize: 44.0,
                            fillColor:
                                FlutterFlowTheme.of(context).imagerySurface,
                            icon: Icon(
                              Icons.arrow_back,
                              color: FlutterFlowTheme.of(context).imageryCream,
                              size: 21.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'IMAGE_STYLES_PAGE_IconButton_ON_TAP');
                              logFirebaseEvent('IconButton_navigate_back');
                              context.pop();
                            },
                          ),
                        )),
                        Text(
                          'Imagery',
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: 'BlauerNue',
                                color:
                                    FlutterFlowTheme.of(context).imageryCream,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment:
                          (FFMainAxisAlignment.start).flutterValue,
                      crossAxisAlignment:
                          (FFCrossAxisAlignment.start).flutterValue,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          'See words in a new light',
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Gendy',
                                color:
                                    FlutterFlowTheme.of(context).imageryCream,
                                letterSpacing: 0.0,
                              ),
                        ),
                        Text(
                          'Give your word of the day a look that feels like you.',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'BlauerNue',
                                color:
                                    FlutterFlowTheme.of(context).imageryMuted,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ].divide(SizedBox(height: 6.0)),
                    ).animateOnPageLoad(
                        animationsMap['columnOnPageLoadAnimation']!),
                    Container(
                      width: double.infinity,
                      height: 244.0,
                      child: Stack(
                        children: [
                          PageView(
                            controller: _model.imageryPreviewController ??=
                                PageController(initialPage: 0),
                            onPageChanged: (_) => safeSetState(() {}),
                            scrollDirection: Axis.horizontal,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(22.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22.0),
                                  ),
                                  child: Stack(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      Image.asset(
                                        'assets/images/lexity-petrichor-watercolour.jpg',
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 122.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                FlutterFlowTheme.of(context)
                                                    .imageryOverlay,
                                                FlutterFlowTheme.of(context)
                                                    .imageryClear
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.0, 1.0),
                                              end:
                                                  AlignmentDirectional(0, -1.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, -1.0),
                                        child: Padding(
                                          padding: EdgeInsets.all(14.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .imageryOverlay,
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
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
                                                      fontFamily: 'BlauerNue',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .imageryCream,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 17.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                (FFMainAxisAlignment.start)
                                                    .flutterValue,
                                            crossAxisAlignment:
                                                (FFCrossAxisAlignment.start)
                                                    .flutterValue,
                                            textBaseline:
                                                TextBaseline.alphabetic,
                                            children: [
                                              Text(
                                                'Petrichor',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Gendy',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .imageryCream,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                'The scent of rain on dry earth.',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'BlauerNue',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .imageryCream,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ].divide(SizedBox(height: 3.0)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(22.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22.0),
                                  ),
                                  child: Stack(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      Image.asset(
                                        'assets/images/lexity-petrichor-neon-noir.jpg',
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 122.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                FlutterFlowTheme.of(context)
                                                    .imageryOverlay,
                                                FlutterFlowTheme.of(context)
                                                    .imageryClear
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.0, 1.0),
                                              end:
                                                  AlignmentDirectional(0, -1.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, -1.0),
                                        child: Padding(
                                          padding: EdgeInsets.all(14.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .imageryOverlay,
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
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
                                                      fontFamily: 'BlauerNue',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .imageryCream,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 17.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                (FFMainAxisAlignment.start)
                                                    .flutterValue,
                                            crossAxisAlignment:
                                                (FFCrossAxisAlignment.start)
                                                    .flutterValue,
                                            textBaseline:
                                                TextBaseline.alphabetic,
                                            children: [
                                              Text(
                                                'Petrichor',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Gendy',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .imageryCream,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                'The scent of rain on dry earth.',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'BlauerNue',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .imageryCream,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ].divide(SizedBox(height: 3.0)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(22.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22.0),
                                  ),
                                  child: Stack(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      Image.asset(
                                        'assets/images/lexity-petrichor-paper-cut.jpg',
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 122.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                FlutterFlowTheme.of(context)
                                                    .imageryOverlay,
                                                FlutterFlowTheme.of(context)
                                                    .imageryClear
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.0, 1.0),
                                              end:
                                                  AlignmentDirectional(0, -1.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, -1.0),
                                        child: Padding(
                                          padding: EdgeInsets.all(14.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .imageryOverlay,
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
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
                                                      fontFamily: 'BlauerNue',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .imageryCream,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 17.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                (FFMainAxisAlignment.start)
                                                    .flutterValue,
                                            crossAxisAlignment:
                                                (FFCrossAxisAlignment.start)
                                                    .flutterValue,
                                            textBaseline:
                                                TextBaseline.alphabetic,
                                            children: [
                                              Text(
                                                'Petrichor',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Gendy',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .imageryCream,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                'The scent of rain on dry earth.',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'BlauerNue',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .imageryCream,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ].divide(SizedBox(height: 3.0)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 12.0, 0.0),
                              child: smooth_page_indicator.SmoothPageIndicator(
                                controller: _model.imageryPreviewController ??=
                                    PageController(initialPage: 0),
                                count: 3,
                                axisDirection: Axis.horizontal,
                                onDotClicked: (i) async {
                                  await _model.imageryPreviewController!
                                      .animateToPage(
                                    i,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                  safeSetState(() {});
                                },
                                effect:
                                    smooth_page_indicator.ExpandingDotsEffect(
                                  expansionFactor: 2.0,
                                  spacing: 5.0,
                                  radius: 8.0,
                                  dotWidth: 7.0,
                                  dotHeight: 7.0,
                                  dotColor:
                                      FlutterFlowTheme.of(context).imageryMuted,
                                  activeDotColor:
                                      FlutterFlowTheme.of(context).imageryCream,
                                  paintStyle: PaintingStyle.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).animateOnPageLoad(
                        animationsMap['pageViewOnPageLoadAnimation']!),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment:
                          (FFMainAxisAlignment.spaceBetween).flutterValue,
                      crossAxisAlignment:
                          (FFCrossAxisAlignment.center).flutterValue,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Expanded(
                          child: Text(
                            'Swipe to compare three styles',
                            style: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: 'BlauerNue',
                                  color:
                                      FlutterFlowTheme.of(context).imageryMuted,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment:
                              (FFMainAxisAlignment.start).flutterValue,
                          crossAxisAlignment:
                              (FFCrossAxisAlignment.center).flutterValue,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            MergeSemantics(
                                child: Semantics(
                              label: 'Previous style preview',
                              child: FlutterFlowIconButton(
                                borderRadius: 22.0,
                                buttonSize: 44.0,
                                fillColor:
                                    FlutterFlowTheme.of(context).imagerySurface,
                                icon: Icon(
                                  Icons.chevron_left,
                                  color:
                                      FlutterFlowTheme.of(context).imageryCream,
                                  size: 20.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'IMAGE_STYLES_PAGE_IconButton_ON_TAP');
                                  logFirebaseEvent('IconButton_page_view');
                                  await _model.imageryPreviewController
                                      ?.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                },
                              ),
                            )),
                            MergeSemantics(
                                child: Semantics(
                              label: 'Next style preview',
                              child: FlutterFlowIconButton(
                                borderRadius: 22.0,
                                buttonSize: 44.0,
                                fillColor:
                                    FlutterFlowTheme.of(context).imagerySurface,
                                icon: Icon(
                                  Icons.chevron_right,
                                  color:
                                      FlutterFlowTheme.of(context).imageryCream,
                                  size: 20.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'IMAGE_STYLES_PAGE_IconButton_ON_TAP');
                                  logFirebaseEvent('IconButton_page_view');
                                  await _model.imageryPreviewController
                                      ?.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                },
                              ),
                            )),
                          ].divide(SizedBox(width: 4.0)),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).imagerySurface,
                        borderRadius: BorderRadius.circular(22.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).imageryLine,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment:
                              (FFMainAxisAlignment.start).flutterValue,
                          crossAxisAlignment:
                              (FFCrossAxisAlignment.start).flutterValue,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment:
                                  (FFMainAxisAlignment.start).flutterValue,
                              crossAxisAlignment:
                                  (FFCrossAxisAlignment.center).flutterValue,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Style Pack',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Gendy',
                                          color: FlutterFlowTheme.of(context)
                                              .imageryCream,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Text(
                                  '\$2.99 / month',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'BlauerNue',
                                        color: FlutterFlowTheme.of(context)
                                            .imageryMint,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                            Text(
                              'Choose from eight styles and switch whenever inspiration strikes.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'BlauerNue',
                                    color: FlutterFlowTheme.of(context)
                                        .imageryMuted,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Text(
                              'Plan preview · Preference saving only',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'BlauerNue',
                                    color: FlutterFlowTheme.of(context)
                                        .imageryMuted,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment:
                                  (FFMainAxisAlignment.start).flutterValue,
                              crossAxisAlignment:
                                  (FFCrossAxisAlignment.center).flutterValue,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      (FFMainAxisAlignment.start).flutterValue,
                                  crossAxisAlignment:
                                      (FFCrossAxisAlignment.center)
                                          .flutterValue,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Expanded(
                                      child: Semantics(
                                        button: true,
                                        selected: _model.selectedStyle ==
                                            'watercolour',
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'IMAGE_STYLES_StyleOption_watercolour_ON_');
                                            logFirebaseEvent(
                                                'StyleOption_watercolour_update_page_stat');
                                            _model.selectedStyle =
                                                'watercolour';
                                            safeSetState(() {});
                                          },
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 100),
                                            curve: Curves.easeIn,
                                            width: double.infinity,
                                            height: 44.0,
                                            decoration: BoxDecoration(
                                              color: _model.selectedStyle ==
                                                      'watercolour'
                                                  ? FlutterFlowTheme.of(context)
                                                      .imageryMint
                                                  : FlutterFlowTheme.of(context)
                                                      .imageryTile,
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                              border: Border.all(
                                                color:
                                                    _model.selectedStyle ==
                                                            'watercolour'
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .imageryMint
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .imageryLine,
                                                width: 1.0,
                                              ),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(6.0, 0.0, 6.0, 0.0),
                                              child: Text(
                                                'Watercolour',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'BlauerNue',
                                                      color: _model
                                                                  .selectedStyle ==
                                                              'watercolour'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .imageryNight
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .imageryCream,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Semantics(
                                        button: true,
                                        selected:
                                            _model.selectedStyle == 'inkSketch',
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'IMAGE_STYLES_StyleOption_inkSketch_ON_TA');
                                            logFirebaseEvent(
                                                'StyleOption_inkSketch_update_page_state');
                                            _model.selectedStyle = 'inkSketch';
                                            safeSetState(() {});
                                          },
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 100),
                                            curve: Curves.easeIn,
                                            width: double.infinity,
                                            height: 44.0,
                                            decoration: BoxDecoration(
                                              color: _model.selectedStyle ==
                                                      'inkSketch'
                                                  ? FlutterFlowTheme.of(context)
                                                      .imageryMint
                                                  : FlutterFlowTheme.of(context)
                                                      .imageryTile,
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                              border: Border.all(
                                                color: _model.selectedStyle ==
                                                        'inkSketch'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .imageryMint
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .imageryLine,
                                                width: 1.0,
                                              ),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(6.0, 0.0, 6.0, 0.0),
                                              child: Text(
                                                'Ink Sketch',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'BlauerNue',
                                                      color: _model
                                                                  .selectedStyle ==
                                                              'inkSketch'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .imageryNight
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .imageryCream,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      (FFMainAxisAlignment.start).flutterValue,
                                  crossAxisAlignment:
                                      (FFCrossAxisAlignment.center)
                                          .flutterValue,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Expanded(
                                      child: Semantics(
                                        button: true,
                                        selected: _model.selectedStyle ==
                                            'retroPoster',
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'IMAGE_STYLES_StyleOption_retroPoster_ON_');
                                            logFirebaseEvent(
                                                'StyleOption_retroPoster_update_page_stat');
                                            _model.selectedStyle =
                                                'retroPoster';
                                            safeSetState(() {});
                                          },
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 100),
                                            curve: Curves.easeIn,
                                            width: double.infinity,
                                            height: 44.0,
                                            decoration: BoxDecoration(
                                              color: _model.selectedStyle ==
                                                      'retroPoster'
                                                  ? FlutterFlowTheme.of(context)
                                                      .imageryMint
                                                  : FlutterFlowTheme.of(context)
                                                      .imageryTile,
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                              border: Border.all(
                                                color:
                                                    _model.selectedStyle ==
                                                            'retroPoster'
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .imageryMint
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .imageryLine,
                                                width: 1.0,
                                              ),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(6.0, 0.0, 6.0, 0.0),
                                              child: Text(
                                                'Retro Poster',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'BlauerNue',
                                                      color: _model
                                                                  .selectedStyle ==
                                                              'retroPoster'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .imageryNight
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .imageryCream,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Semantics(
                                        button: true,
                                        selected:
                                            _model.selectedStyle == 'ukiyoE',
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'IMAGE_STYLES_StyleOption_ukiyoE_ON_TAP');
                                            logFirebaseEvent(
                                                'StyleOption_ukiyoE_update_page_state');
                                            _model.selectedStyle = 'ukiyoE';
                                            safeSetState(() {});
                                          },
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 100),
                                            curve: Curves.easeIn,
                                            width: double.infinity,
                                            height: 44.0,
                                            decoration: BoxDecoration(
                                              color: _model.selectedStyle ==
                                                      'ukiyoE'
                                                  ? FlutterFlowTheme.of(context)
                                                      .imageryMint
                                                  : FlutterFlowTheme.of(context)
                                                      .imageryTile,
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                              border: Border.all(
                                                color: _model.selectedStyle ==
                                                        'ukiyoE'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .imageryMint
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .imageryLine,
                                                width: 1.0,
                                              ),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(6.0, 0.0, 6.0, 0.0),
                                              child: Text(
                                                'Ukiyo-e',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'BlauerNue',
                                                      color: _model
                                                                  .selectedStyle ==
                                                              'ukiyoE'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .imageryNight
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .imageryCream,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      (FFMainAxisAlignment.start).flutterValue,
                                  crossAxisAlignment:
                                      (FFCrossAxisAlignment.center)
                                          .flutterValue,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Expanded(
                                      child: Semantics(
                                        button: true,
                                        selected: _model.selectedStyle ==
                                            'claymation',
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'IMAGE_STYLES_StyleOption_claymation_ON_T');
                                            logFirebaseEvent(
                                                'StyleOption_claymation_update_page_state');
                                            _model.selectedStyle = 'claymation';
                                            safeSetState(() {});
                                          },
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 100),
                                            curve: Curves.easeIn,
                                            width: double.infinity,
                                            height: 44.0,
                                            decoration: BoxDecoration(
                                              color: _model.selectedStyle ==
                                                      'claymation'
                                                  ? FlutterFlowTheme.of(context)
                                                      .imageryMint
                                                  : FlutterFlowTheme.of(context)
                                                      .imageryTile,
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                              border: Border.all(
                                                color: _model.selectedStyle ==
                                                        'claymation'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .imageryMint
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .imageryLine,
                                                width: 1.0,
                                              ),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(6.0, 0.0, 6.0, 0.0),
                                              child: Text(
                                                'Claymation',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'BlauerNue',
                                                      color: _model
                                                                  .selectedStyle ==
                                                              'claymation'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .imageryNight
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .imageryCream,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Semantics(
                                        button: true,
                                        selected:
                                            _model.selectedStyle == 'neonNoir',
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'IMAGE_STYLES_StyleOption_neonNoir_ON_TAP');
                                            logFirebaseEvent(
                                                'StyleOption_neonNoir_update_page_state');
                                            _model.selectedStyle = 'neonNoir';
                                            safeSetState(() {});
                                          },
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 100),
                                            curve: Curves.easeIn,
                                            width: double.infinity,
                                            height: 44.0,
                                            decoration: BoxDecoration(
                                              color: _model.selectedStyle ==
                                                      'neonNoir'
                                                  ? FlutterFlowTheme.of(context)
                                                      .imageryMint
                                                  : FlutterFlowTheme.of(context)
                                                      .imageryTile,
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                              border: Border.all(
                                                color: _model.selectedStyle ==
                                                        'neonNoir'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .imageryMint
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .imageryLine,
                                                width: 1.0,
                                              ),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(6.0, 0.0, 6.0, 0.0),
                                              child: Text(
                                                'Neon Noir',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'BlauerNue',
                                                      color: _model
                                                                  .selectedStyle ==
                                                              'neonNoir'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .imageryNight
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .imageryCream,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      (FFMainAxisAlignment.start).flutterValue,
                                  crossAxisAlignment:
                                      (FFCrossAxisAlignment.center)
                                          .flutterValue,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Expanded(
                                      child: Semantics(
                                        button: true,
                                        selected:
                                            _model.selectedStyle == 'pixelArt',
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'IMAGE_STYLES_StyleOption_pixelArt_ON_TAP');
                                            logFirebaseEvent(
                                                'StyleOption_pixelArt_update_page_state');
                                            _model.selectedStyle = 'pixelArt';
                                            safeSetState(() {});
                                          },
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 100),
                                            curve: Curves.easeIn,
                                            width: double.infinity,
                                            height: 44.0,
                                            decoration: BoxDecoration(
                                              color: _model.selectedStyle ==
                                                      'pixelArt'
                                                  ? FlutterFlowTheme.of(context)
                                                      .imageryMint
                                                  : FlutterFlowTheme.of(context)
                                                      .imageryTile,
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                              border: Border.all(
                                                color: _model.selectedStyle ==
                                                        'pixelArt'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .imageryMint
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .imageryLine,
                                                width: 1.0,
                                              ),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(6.0, 0.0, 6.0, 0.0),
                                              child: Text(
                                                'Pixel Art',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'BlauerNue',
                                                      color: _model
                                                                  .selectedStyle ==
                                                              'pixelArt'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .imageryNight
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .imageryCream,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Semantics(
                                        button: true,
                                        selected:
                                            _model.selectedStyle == 'paperCut',
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'IMAGE_STYLES_StyleOption_paperCut_ON_TAP');
                                            logFirebaseEvent(
                                                'StyleOption_paperCut_update_page_state');
                                            _model.selectedStyle = 'paperCut';
                                            safeSetState(() {});
                                          },
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 100),
                                            curve: Curves.easeIn,
                                            width: double.infinity,
                                            height: 44.0,
                                            decoration: BoxDecoration(
                                              color: _model.selectedStyle ==
                                                      'paperCut'
                                                  ? FlutterFlowTheme.of(context)
                                                      .imageryMint
                                                  : FlutterFlowTheme.of(context)
                                                      .imageryTile,
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                              border: Border.all(
                                                color: _model.selectedStyle ==
                                                        'paperCut'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .imageryMint
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .imageryLine,
                                                width: 1.0,
                                              ),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(6.0, 0.0, 6.0, 0.0),
                                              child: Text(
                                                'Paper Cut',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'BlauerNue',
                                                      color: _model
                                                                  .selectedStyle ==
                                                              'paperCut'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .imageryNight
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .imageryCream,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                              ].divide(SizedBox(height: 7.0)),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'IMAGE_STYLES_PAGE_Button_ON_TAP');
                                if (_model.selectedStyle == '') {
                                  logFirebaseEvent('Button_show_snack_bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Pick a style first',
                                        style: TextStyle(),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                    ),
                                  );
                                } else {
                                  logFirebaseEvent('Button_backend_call');

                                  await currentUserReference!
                                      .update(createUsersRecordData(
                                    imageStylePlan: 'stylePack',
                                    imageStyle: _model.selectedStyle,
                                    customImageStyle: '',
                                  ));
                                  logFirebaseEvent('Button_show_snack_bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Style Pack style saved',
                                        style: TextStyle(),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                    ),
                                  );
                                }
                              },
                              text: 'Save Style Pack preference',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 56.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).imageryMint,
                                textStyle: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).imageryNight,
                                ),
                                borderRadius: BorderRadius.circular(28.0),
                              ),
                            ),
                          ].divide(SizedBox(height: 9.0)),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).imagerySurface,
                        borderRadius: BorderRadius.circular(22.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).imageryLine,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment:
                              (FFMainAxisAlignment.start).flutterValue,
                          crossAxisAlignment:
                              (FFCrossAxisAlignment.start).flutterValue,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment:
                                  (FFMainAxisAlignment.start).flutterValue,
                              crossAxisAlignment:
                                  (FFCrossAxisAlignment.center).flutterValue,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Your Own Style',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Gendy',
                                          color: FlutterFlowTheme.of(context)
                                              .imageryCream,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Text(
                                  '\$5.99 / month',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'BlauerNue',
                                        color: FlutterFlowTheme.of(context)
                                            .imageryMuted,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                            Text(
                              'Describe any look you like and every word is drawn that way.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'BlauerNue',
                                    color: FlutterFlowTheme.of(context)
                                        .imageryMuted,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            TextFormField(
                              controller: _model.customStyleFieldTextController,
                              focusNode: _model.customStyleFieldFocusNode,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Describe your style',
                                labelStyle: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).imageryMuted,
                                ),
                                hintText:
                                    'e.g. 1970s botanical illustration, muted greens',
                                hintStyle: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).imageryMuted,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .imageryLine,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .imageryMint,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                filled: true,
                                fillColor:
                                    FlutterFlowTheme.of(context).imageryNight,
                              ),
                              style: TextStyle(
                                color:
                                    FlutterFlowTheme.of(context).imageryCream,
                              ),
                              maxLines: 3,
                              validator: _model
                                  .customStyleFieldTextControllerValidator
                                  .asValidator(context),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'IMAGE_STYLES_PAGE_Button_ON_TAP');
                                if (_model.customStyleFieldTextController
                                            .text ==
                                        null ||
                                    _model.customStyleFieldTextController
                                            .text ==
                                        '') {
                                  logFirebaseEvent('Button_show_snack_bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Describe your style first',
                                        style: TextStyle(),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                    ),
                                  );
                                } else {
                                  logFirebaseEvent('Button_backend_call');

                                  await currentUserReference!
                                      .update(createUsersRecordData(
                                    imageStylePlan: 'custom',
                                    imageStyle: 'custom',
                                    customImageStyle: _model
                                        .customStyleFieldTextController.text,
                                  ));
                                  logFirebaseEvent('Button_show_snack_bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Your custom style is saved',
                                        style: TextStyle(),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                    ),
                                  );
                                }
                              },
                              text: 'Save custom preference',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 56.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).imageryTile,
                                textStyle: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).imageryCream,
                                ),
                                borderRadius: BorderRadius.circular(28.0),
                              ),
                            ),
                          ].divide(SizedBox(height: 12.0)),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).imagerySurface,
                        borderRadius: BorderRadius.circular(22.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).imageryLine,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment:
                              (FFMainAxisAlignment.start).flutterValue,
                          crossAxisAlignment:
                              (FFCrossAxisAlignment.start).flutterValue,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment:
                                  (FFMainAxisAlignment.start).flutterValue,
                              crossAxisAlignment:
                                  (FFCrossAxisAlignment.center).flutterValue,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Lexity Signature',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Gendy',
                                          color: FlutterFlowTheme.of(context)
                                              .imageryCream,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Text(
                                  'Included',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'BlauerNue',
                                        color: FlutterFlowTheme.of(context)
                                            .imageryMuted,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                            Text(
                              'The hand-picked look every word ships with.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'BlauerNue',
                                    color: FlutterFlowTheme.of(context)
                                        .imageryMuted,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'IMAGE_STYLES_PAGE_Button_ON_TAP');
                                logFirebaseEvent('Button_update_page_state');
                                _model.selectedStyle = '';
                                safeSetState(() {});
                                logFirebaseEvent('Button_backend_call');

                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  imageStylePlan: 'default',
                                  imageStyle: 'signature',
                                  customImageStyle: '',
                                ));
                                logFirebaseEvent('Button_show_snack_bar');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Using the Lexity Signature style',
                                      style: TextStyle(),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                  ),
                                );
                              },
                              text: 'Use default',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 56.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).imageryTile,
                                textStyle: TextStyle(
                                  color: FlutterFlowTheme.of(context).info,
                                ),
                                borderRadius: BorderRadius.circular(28.0),
                              ),
                            ),
                          ].divide(SizedBox(height: 12.0)),
                        ),
                      ),
                    ),
                    Container(
                      height: 10.0,
                    ),
                  ].divide(SizedBox(height: 14.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

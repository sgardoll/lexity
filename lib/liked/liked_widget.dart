import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'liked_model.dart';
export 'liked_model.dart';

/// a list of all the words the user has liked (from the user's collection)
class LikedWidget extends StatefulWidget {
  const LikedWidget({super.key});

  static String routeName = 'Liked';
  static String routePath = 'liked';

  @override
  State<LikedWidget> createState() => _LikedWidgetState();
}

class _LikedWidgetState extends State<LikedWidget> {
  late LikedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LikedModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Liked'});
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

        backgroundColor: FlutterFlowTheme.of(context).primaryText,

        body: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,

          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1A1F24), Color(0xFF2B2E3B), Color(0xFF1F1F2B)],
              stops: [0.0, 0.5, 1.0],
              begin: AlignmentDirectional(0.0, 1.0),
              end: AlignmentDirectional(0, -1.0),
            ),
          ),

          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 100.0,

                  decoration: BoxDecoration(),

                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FlutterFlowIconButton(
                        borderRadius: 8.0,

                        buttonSize: 75.0,

                        icon: Icon(
                          Icons.arrow_back,
                          color: FlutterFlowTheme.of(context).info,
                          size: 35.0,
                        ),

                        onPressed: () async {
                          logFirebaseEvent('LIKED_PAGE_arrow_back_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_navigate_back');
                          context.safePop();
                        },
                      ),
                      Expanded(
                        child: AutoSizeText(
                          'Likes',
                          textAlign: TextAlign.start,

                          style: FlutterFlowTheme.of(context).displaySmall
                              .override(
                                font: GoogleFonts.readexPro(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(
                                    context,
                                  ).displaySmall.fontStyle,
                                ),

                                color: Colors.white,

                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(
                                  context,
                                ).displaySmall.fontStyle,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Words you\'ve liked will appear here',
                  textAlign: TextAlign.center,

                  style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                Flexible(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,

                    decoration: BoxDecoration(
                      color: Color(0x7F57636C),

                      borderRadius: BorderRadius.circular(12.0),
                    ),

                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                        16.0,
                        16.0,
                        16.0,
                        16.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StreamBuilder<List<LexiconRecord>>(
                            stream: queryLexiconRecord(
                              queryBuilder: (lexiconRecord) =>
                                  lexiconRecord.where(
                                    'likedBy',
                                    arrayContains: currentUserReference,
                                  ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<LexiconRecord> listViewLexiconRecordList =
                                  snapshot.data!;

                              return ListView.builder(
                                padding: EdgeInsets.zero,

                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewLexiconRecordList.length,

                                itemBuilder: (context, listViewIndex) {
                                  final listViewLexiconRecord =
                                      listViewLexiconRecordList[listViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0,
                                      8.0,
                                      8.0,
                                      8.0,
                                    ),
                                    child: Container(
                                      width: double.infinity,

                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                      ),

                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,

                                        children: [
                                          Flexible(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,

                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  listViewLexiconRecord.term,

                                                  style:
                                                      FlutterFlowTheme.of(
                                                        context,
                                                      ).titleMedium.override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                    context,
                                                                  )
                                                                  .titleMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                    context,
                                                                  )
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),

                                                        color: Colors.white,

                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                  context,
                                                                )
                                                                .titleMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                  context,
                                                                )
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                                Text(
                                                  listViewLexiconRecord
                                                      .definition,

                                                  maxLines: 5,

                                                  style:
                                                      FlutterFlowTheme.of(
                                                        context,
                                                      ).bodySmall.override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                    context,
                                                                  )
                                                                  .bodySmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                    context,
                                                                  )
                                                                  .bodySmall
                                                                  .fontStyle,
                                                        ),

                                                        color:
                                                            FlutterFlowTheme.of(
                                                              context,
                                                            ).info,

                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                  context,
                                                                )
                                                                .bodySmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                  context,
                                                                )
                                                                .bodySmall
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          FlutterFlowIconButton(
                                            buttonSize: 60.0,

                                            icon: Icon(
                                              Icons.bookmark_remove_sharp,
                                              color: FlutterFlowTheme.of(
                                                context,
                                              ).error,
                                              size: 24.0,
                                            ),

                                            onPressed: () async {
                                              logFirebaseEvent(
                                                'LIKED_bookmark_remove_sharp_ICN_ON_TAP',
                                              );
                                              logFirebaseEvent(
                                                'IconButton_backend_call',
                                              );

                                              await listViewLexiconRecord
                                                  .reference
                                                  .update({
                                                    ...mapToFirestore({
                                                      'likedBy':
                                                          FieldValue.arrayRemove([
                                                            currentUserReference,
                                                          ]),
                                                    }),
                                                  });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ].divide(SizedBox(height: 12.0)),
                      ),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 24.0)),
            ),
          ),
        ),
      ),
    );
  }
}

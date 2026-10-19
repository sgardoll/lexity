import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'settings_model.dart';
export 'settings_model.dart';

/// A settings page with options to Login, Turn Sound on and off, Turn
/// notifications on or off, view liked words and logout
class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  static String routeName = 'settings';
  static String routePath = 'settings';

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late SettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'settings'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SETTINGS_PAGE_settings_ON_INIT_STATE');
      if (!(currentUserDocument?.settings != null)) {
        logFirebaseEvent('settings_backend_call');

        var settingsRecordReference = SettingsRecord.collection.doc();
        await settingsRecordReference.set(createSettingsRecordData(
          uid: currentUserReference?.id,
          soundOn: _model.switchValue1,
          notificationsOn: _model.switchValue2,
        ));
        _model.newSettings = SettingsRecord.getDocumentFromData(
            createSettingsRecordData(
              uid: currentUserReference?.id,
              soundOn: _model.switchValue1,
              notificationsOn: _model.switchValue2,
            ),
            settingsRecordReference);
        logFirebaseEvent('settings_backend_call');

        await currentUserReference!.update(createUsersRecordData(
          settings: _model.newSettings?.reference,
        ));
      }
    });

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
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF1A1F24),
                  Color(0xFF2B2E3B),
                  Color(0xFF1F1F2B)
                ],
                stops: [0.0, 0.5, 1.0],
                begin: AlignmentDirectional(0.0, 1.0),
                end: AlignmentDirectional(0, -1.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: (FFMainAxisAlignment.start).flutterValue,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        Expanded(
                          child: AutoSizeText(
                            'Settings',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'Gendy',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: FutureBuilder<List<SettingsRecord>>(
                      future: querySettingsRecordOnce(
                        queryBuilder: (settingsRecord) => settingsRecord.where(
                          'uid',
                          isEqualTo: currentUserReference?.id,
                        ),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 30.0,
                              height: 30.0,
                              child: SpinKitPulse(
                                color: FlutterFlowTheme.of(context).accent4,
                                size: 30.0,
                              ),
                            ),
                          );
                        }
                        List<SettingsRecord> containerSettingsRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final containerSettingsRecord =
                            containerSettingsRecordList.isNotEmpty
                                ? containerSettingsRecordList.first
                                : null;

                        return AnimatedContainer(
                          duration: Duration(milliseconds: 900),
                          curve: Curves.easeInOut,
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Color(0x7F57636C),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 20.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Sound',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'BlauerNue',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Switch.adaptive(
                                        value: _model.switchValue1 ??=
                                            containerSettingsRecord!.soundOn,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.switchValue1 = newValue);
                                          if (newValue) {
                                            logFirebaseEvent(
                                                'SETTINGS_Switch_w8ooa2c1_ON_TOGGLE_ON');
                                            logFirebaseEvent(
                                                'Switch_backend_call');

                                            await currentUserDocument!.settings!
                                                .update(
                                                    createSettingsRecordData(
                                              soundOn: true,
                                            ));
                                            logFirebaseEvent(
                                                'Switch_update_app_state');
                                            FFAppState().isSoundOn = true;
                                            FFAppState().update(() {});
                                          } else {
                                            logFirebaseEvent(
                                                'SETTINGS_Switch_w8ooa2c1_ON_TOGGLE_OFF');
                                            logFirebaseEvent(
                                                'Switch_backend_call');

                                            await currentUserDocument!.settings!
                                                .update(
                                                    createSettingsRecordData(
                                              soundOn: false,
                                            ));
                                            logFirebaseEvent(
                                                'Switch_update_app_state');
                                            FFAppState().isSoundOn = false;
                                            FFAppState().update(() {});
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Notifications',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'BlauerNue',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Switch.adaptive(
                                        value: _model.switchValue2 ??=
                                            containerSettingsRecord!
                                                .notificationsOn,
                                        onChanged: (newValue) async {
                                          safeSetState(() =>
                                              _model.switchValue2 = newValue);
                                          if (newValue) {
                                            logFirebaseEvent(
                                                'SETTINGS_Switch_mnxwr64k_ON_TOGGLE_ON');
                                            logFirebaseEvent(
                                                'Switch_request_permissions');
                                            await requestPermission(
                                                notificationsPermission);
                                            logFirebaseEvent(
                                                'Switch_backend_call');

                                            await currentUserDocument!.settings!
                                                .update(
                                                    createSettingsRecordData(
                                              notificationsOn: true,
                                            ));
                                            logFirebaseEvent(
                                                'Switch_rebuild_page');
                                            safeSetState(() {});
                                          } else {
                                            logFirebaseEvent(
                                                'SETTINGS_Switch_mnxwr64k_ON_TOGGLE_OFF');
                                            logFirebaseEvent(
                                                'Switch_request_permissions');
                                            await requestPermission(
                                                notificationsPermission);
                                            logFirebaseEvent(
                                                'Switch_backend_call');

                                            await currentUserDocument!.settings!
                                                .update(
                                                    createSettingsRecordData(
                                              notificationsOn: false,
                                            ));
                                            logFirebaseEvent(
                                                'Switch_rebuild_page');
                                            safeSetState(() {});
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .accent4,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                      ),
                                    ],
                                  ),
                                ].divide(SizedBox(height: 24.0)),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('SETTINGS_PAGE_Button_fdg72m6k_ON_TAP');
                      logFirebaseEvent('Button_auth');
                      GoRouter.of(context).prepareAuthEvent();
                      await authManager.signOut();
                      GoRouter.of(context).clearRedirectLocation();

                      context.goNamedAuth(
                          AnonLoginWidget.routeName, context.mounted);
                    },
                    text: loggedIn ? 'Logout' : 'Login',
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 56.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFFFF5963),
                      textStyle:
                          FlutterFlowTheme.of(context).titleLarge.override(
                                fontFamily: 'BlauerNue',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                  ),
                  if (loggedIn)
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Builder(
                        builder: (context) => FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'SETTINGS_PAGE_DELETE_ACCOUNT_BTN_ON_TAP');
                            logFirebaseEvent('Button_auth');
                            await authManager.deleteUser(context);

                            context.goNamedAuth(
                                StartWidget.routeName, context.mounted);
                          },
                          text: 'Delete Account',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 56.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Colors.transparent,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'BlauerNue',
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(28.0),
                          ),
                        ),
                      ),
                    ),
                ].divide(SizedBox(height: 24.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

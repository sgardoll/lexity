import '/auth/firebase_auth/auth_util.dart';
import '/components/login_popup_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'settings_model.dart';
export 'settings_model.dart';

/// A settings page with options to Login, Turn Sound on and off, Turn
/// notifications on or off, view liked words and logout
class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  static String routeName = 'Settings';
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

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Settings'});
    _model.switchValue1 = true;
    _model.switchValue2 = true;
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        FlutterFlowIconButton(
                          borderRadius: 8.0,

                          buttonSize: 75.0,

                          icon: Icon(
                            Icons.arrow_back,
                            color: FlutterFlowTheme.of(context).info,
                            size: 35.0,
                          ),

                          onPressed: () async {
                            logFirebaseEvent(
                              'SETTINGS_PAGE_arrow_back_ICN_ON_TAP',
                            );
                            logFirebaseEvent('IconButton_navigate_back');
                            context.safePop();
                          },
                        ),
                        Expanded(
                          child: AutoSizeText(
                            'Settings',
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
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,

                    decoration: BoxDecoration(
                      color: Color(0x7F57636C),

                      borderRadius: BorderRadius.circular(16.0),
                    ),

                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                        20.0,
                        20.0,
                        20.0,
                        20.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,

                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Text(
                                'Sound',

                                style: FlutterFlowTheme.of(context).titleLarge
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(
                                          context,
                                        ).titleLarge.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(
                                          context,
                                        ).titleLarge.fontStyle,
                                      ),

                                      color: Colors.white,

                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(
                                        context,
                                      ).titleLarge.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(
                                        context,
                                      ).titleLarge.fontStyle,
                                    ),
                              ),
                              Switch(
                                value: _model.switchValue1!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                    () => _model.switchValue1 = newValue,
                                  );
                                  if (newValue) {
                                    logFirebaseEvent(
                                      'SETTINGS_Switch_w8ooa2c1_ON_TOGGLE_ON',
                                    );
                                    logFirebaseEvent(
                                      'Switch_request_permissions',
                                    );
                                    await requestPermission(
                                      microphonePermission,
                                    );
                                    logFirebaseEvent(
                                      'Switch_request_permissions',
                                    );
                                    await requestPermission(
                                      microphonePermission,
                                    );
                                  }
                                },
                                activeThumbColor: FlutterFlowTheme.of(
                                  context,
                                ).accent4,
                                activeTrackColor: FlutterFlowTheme.of(
                                  context,
                                ).tertiary,
                                inactiveTrackColor: FlutterFlowTheme.of(
                                  context,
                                ).secondaryText,
                                inactiveThumbColor: FlutterFlowTheme.of(
                                  context,
                                ).alternate,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Text(
                                'Notifications',

                                style: FlutterFlowTheme.of(context).titleLarge
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(
                                          context,
                                        ).titleLarge.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(
                                          context,
                                        ).titleLarge.fontStyle,
                                      ),

                                      color: Colors.white,

                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(
                                        context,
                                      ).titleLarge.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(
                                        context,
                                      ).titleLarge.fontStyle,
                                    ),
                              ),
                              Switch(
                                value: _model.switchValue2!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                    () => _model.switchValue2 = newValue,
                                  );
                                  if (newValue) {
                                    logFirebaseEvent(
                                      'SETTINGS_Switch_mnxwr64k_ON_TOGGLE_ON',
                                    );
                                    logFirebaseEvent(
                                      'Switch_request_permissions',
                                    );
                                    await requestPermission(
                                      notificationsPermission,
                                    );
                                  } else {
                                    logFirebaseEvent(
                                      'SETTINGS_Switch_mnxwr64k_ON_TOGGLE_OFF',
                                    );
                                    logFirebaseEvent(
                                      'Switch_request_permissions',
                                    );
                                    await requestPermission(
                                      notificationsPermission,
                                    );
                                  }
                                },
                                activeThumbColor: FlutterFlowTheme.of(
                                  context,
                                ).accent4,
                                activeTrackColor: FlutterFlowTheme.of(
                                  context,
                                ).tertiary,
                                inactiveTrackColor: FlutterFlowTheme.of(
                                  context,
                                ).secondaryText,
                                inactiveThumbColor: FlutterFlowTheme.of(
                                  context,
                                ).alternate,
                              ),
                            ],
                          ),
                        ].divide(SizedBox(height: 24.0)),
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) => FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                          'SETTINGS_PAGE_Button_fdg72m6k_ON_TAP',
                        );
                        if (loggedIn) {
                          logFirebaseEvent('Button_auth');
                          GoRouter.of(context).prepareAuthEvent();
                          await authManager.signOut();
                          GoRouter.of(context).clearRedirectLocation();

                          logFirebaseEvent('Button_navigate_to');

                          context.goNamedAuth(
                            CreateAccountWidget.routeName,
                            context.mounted,
                          );
                        } else {
                          logFirebaseEvent('Button_alert_dialog');
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: AlignmentDirectional(
                                  0.0,
                                  0.0,
                                ).resolve(Directionality.of(context)),
                                child: GestureDetector(
                                  onTap: () {
                                    FocusScope.of(dialogContext).unfocus();
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  child: LoginPopupWidget(),
                                ),
                              );
                            },
                          );
                        }
                      },
                      text: loggedIn ? 'Logout' : 'Login',

                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 56.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          0.0,
                          0.0,
                          0.0,
                        ),

                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          0.0,
                          0.0,
                          0.0,
                        ),

                        color: Color(0xFFFF5963),
                        textStyle: FlutterFlowTheme.of(context).titleLarge
                            .override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(
                                  context,
                                ).titleLarge.fontWeight,
                                fontStyle: FlutterFlowTheme.of(
                                  context,
                                ).titleLarge.fontStyle,
                              ),

                              color: Colors.white,

                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(
                                context,
                              ).titleLarge.fontWeight,
                              fontStyle: FlutterFlowTheme.of(
                                context,
                              ).titleLarge.fontStyle,
                            ),
                        elevation: 3.0,

                        borderRadius: BorderRadius.circular(28.0),
                      ),
                    ),
                  ),
                  if (loggedIn)
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Builder(
                        builder: (context) => FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                              'SETTINGS_PAGE_DELETE_ACCOUNT_BTN_ON_TAP',
                            );
                            logFirebaseEvent('Button_auth');
                            await authManager.deleteUser(context);
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed(CreateAccountWidget.routeName);
                          },
                          text: 'Delete Account',

                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 56.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              0.0,
                              0.0,
                              0.0,
                            ),

                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              0.0,
                              0.0,
                              0.0,
                            ),

                            color: Colors.transparent,
                            textStyle: FlutterFlowTheme.of(context).titleLarge
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(
                                      context,
                                    ).titleLarge.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(
                                      context,
                                    ).titleLarge.fontStyle,
                                  ),

                                  color: FlutterFlowTheme.of(context).info,

                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(
                                    context,
                                  ).titleLarge.fontWeight,
                                  fontStyle: FlutterFlowTheme.of(
                                    context,
                                  ).titleLarge.fontStyle,
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

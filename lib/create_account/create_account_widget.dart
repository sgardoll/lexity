import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'create_account_model.dart';
export 'create_account_model.dart';

/// a page that takes a user that was previously logged in anonymosly with
/// firebase authentication and lets them convert that account into their own
/// account, either with an in-built action, custom function, widget or cloud
/// function
class CreateAccountWidget extends StatefulWidget {
  const CreateAccountWidget({super.key});

  static String routeName = 'CreateAccount';
  static String routePath = 'createAccount';

  @override
  State<CreateAccountWidget> createState() => _CreateAccountWidgetState();
}

class _CreateAccountWidgetState extends State<CreateAccountWidget> {
  late CreateAccountModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateAccountModel());

    logFirebaseEvent(
      'screen_view',
      parameters: {'screen_name': 'CreateAccount'},
    );
    _model.emailTextController ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();
    _model.textFieldFocusNode1!.addListener(() async {
      logFirebaseEvent('CREATE_ACCOUNT_TextField_e1p2fa09_ON_FOC');
      logFirebaseEvent('TextField_firestore_query');
      _model.queryUser = await queryUsersRecordCount(
        queryBuilder: (usersRecord) => usersRecord.where(
          'email',
          isEqualTo: _model.emailTextController.text,
        ),
      );
      if (_model.queryUser! >= 1) {
        logFirebaseEvent('TextField_update_page_state');
        _model.isCurrentUser = true;
        safeSetState(() {});
      } else {
        logFirebaseEvent('TextField_update_page_state');
        _model.isCurrentUser = false;
        safeSetState(() {});
      }

      safeSetState(() {});
    });
    _model.passwordTextController ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.confirmPasswordTextController ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

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
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      12.0,
                      0.0,
                      12.0,
                      0.0,
                    ),
                    child: Image.asset(
                      'assets/images/2nobg.png',
                      width: 120.0,
                      height: 66.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,

                      decoration: BoxDecoration(
                        color: Color(0x7F57636C),

                        borderRadius: BorderRadius.circular(16.0),
                      ),

                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          24.0,
                          24.0,
                          24.0,
                          24.0,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,

                          children: [
                            TextFormField(
                              controller: _model.emailTextController,
                              focusNode: _model.textFieldFocusNode1,

                              autofocus: true,

                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontStyle,
                                      ),

                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(
                                        context,
                                      ).bodyMedium.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(
                                        context,
                                      ).bodyMedium.fontStyle,
                                    ),

                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontStyle,
                                      ),

                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(
                                        context,
                                      ).bodyMedium.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(
                                        context,
                                      ).bodyMedium.fontStyle,
                                    ),

                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(
                                      context,
                                    ).alternate,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(
                                  context,
                                ).primaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context).bodyLarge
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(
                                        context,
                                      ).bodyLarge.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(
                                        context,
                                      ).bodyLarge.fontStyle,
                                    ),

                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(
                                      context,
                                    ).bodyLarge.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(
                                      context,
                                    ).bodyLarge.fontStyle,
                                  ),

                              minLines: 1,

                              keyboardType: TextInputType.emailAddress,

                              validator: _model.emailTextControllerValidator
                                  .asValidator(context),
                            ),
                            TextFormField(
                              controller: _model.passwordTextController,
                              focusNode: _model.textFieldFocusNode2,

                              autofocus: true,

                              obscureText: !_model.passwordVisibility1,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontStyle,
                                      ),

                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(
                                        context,
                                      ).bodyMedium.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(
                                        context,
                                      ).bodyMedium.fontStyle,
                                    ),

                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontStyle,
                                      ),

                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(
                                        context,
                                      ).bodyMedium.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(
                                        context,
                                      ).bodyMedium.fontStyle,
                                    ),

                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(
                                      context,
                                    ).alternate,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(
                                  context,
                                ).primaryBackground,

                                suffixIcon: InkWell(
                                  onTap: () async {
                                    safeSetState(
                                      () => _model.passwordVisibility1 =
                                          !_model.passwordVisibility1,
                                    );
                                  },
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    _model.passwordVisibility1
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: FlutterFlowTheme.of(
                                      context,
                                    ).secondaryText,
                                    size: 22.0,
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).bodyLarge
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(
                                        context,
                                      ).bodyLarge.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(
                                        context,
                                      ).bodyLarge.fontStyle,
                                    ),

                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(
                                      context,
                                    ).bodyLarge.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(
                                      context,
                                    ).bodyLarge.fontStyle,
                                  ),

                              minLines: 1,

                              validator: _model.passwordTextControllerValidator
                                  .asValidator(context),
                            ),
                            if (!_model.isCurrentUser)
                              TextFormField(
                                controller:
                                    _model.confirmPasswordTextController,
                                focusNode: _model.textFieldFocusNode3,

                                autofocus: true,

                                obscureText: !_model.passwordVisibility2,
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FlutterFlowTheme.of(
                                            context,
                                          ).bodyMedium.fontWeight,
                                          fontStyle: FlutterFlowTheme.of(
                                            context,
                                          ).bodyMedium.fontStyle,
                                        ),

                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontStyle,
                                      ),

                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FlutterFlowTheme.of(
                                            context,
                                          ).bodyMedium.fontWeight,
                                          fontStyle: FlutterFlowTheme.of(
                                            context,
                                          ).bodyMedium.fontStyle,
                                        ),

                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontStyle,
                                      ),

                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(
                                        context,
                                      ).alternate,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(
                                    context,
                                  ).primaryBackground,

                                  suffixIcon: InkWell(
                                    onTap: () async {
                                      safeSetState(
                                        () => _model.passwordVisibility2 =
                                            !_model.passwordVisibility2,
                                      );
                                    },
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      _model.passwordVisibility2
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: FlutterFlowTheme.of(
                                        context,
                                      ).secondaryText,
                                      size: 22.0,
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyLarge
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(
                                          context,
                                        ).bodyLarge.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(
                                          context,
                                        ).bodyLarge.fontStyle,
                                      ),

                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(
                                        context,
                                      ).bodyLarge.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(
                                        context,
                                      ).bodyLarge.fontStyle,
                                    ),

                                minLines: 1,

                                validator: _model
                                    .confirmPasswordTextControllerValidator
                                    .asValidator(context),
                              ),
                            Builder(
                              builder: (context) {
                                if (_model.isCurrentUser) {
                                  return FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                        'CREATE_ACCOUNT_PAGE_LOGIN_BTN_ON_TAP',
                                      );
                                      logFirebaseEvent('Button_auth');
                                      GoRouter.of(context).prepareAuthEvent();

                                      final user = await authManager
                                          .signInWithEmail(
                                            context,
                                            _model.emailTextController.text,
                                            _model.passwordTextController.text,
                                          );
                                      if (user == null) {
                                        return;
                                      }

                                      context.goNamedAuth(
                                        StartWidget.routeName,
                                        context.mounted,
                                      );
                                    },
                                    text: valueOrDefault<String>(
                                      _model.isCurrentUser
                                          ? 'Login'
                                          : 'Create Account',
                                      'Create Account',
                                    ),

                                    options: FFButtonOptions(
                                      width:
                                          MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 56.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0,
                                        0.0,
                                        0.0,
                                        0.0,
                                      ),

                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                            0.0,
                                            0.0,
                                            0.0,
                                            0.0,
                                          ),

                                      color: FlutterFlowTheme.of(
                                        context,
                                      ).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FlutterFlowTheme.of(
                                                context,
                                              ).titleMedium.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(
                                                context,
                                              ).titleMedium.fontStyle,
                                            ),

                                            color: FlutterFlowTheme.of(
                                              context,
                                            ).info,

                                            letterSpacing: 0.0,
                                            fontWeight: FlutterFlowTheme.of(
                                              context,
                                            ).titleMedium.fontWeight,
                                            fontStyle: FlutterFlowTheme.of(
                                              context,
                                            ).titleMedium.fontStyle,
                                          ),
                                      elevation: 2.0,

                                      borderRadius: BorderRadius.circular(28.0),
                                    ),
                                  );
                                } else {
                                  return FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                        'CREATE_ACCOUNT_PAGE_LOGIN_BTN_ON_TAP',
                                      );
                                      logFirebaseEvent('Button_auth');
                                      GoRouter.of(context).prepareAuthEvent();
                                      if (_model.passwordTextController.text !=
                                          _model
                                              .confirmPasswordTextController
                                              .text) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Passwords don\'t match!',
                                            ),
                                          ),
                                        );
                                        return;
                                      }

                                      final user = await authManager
                                          .createAccountWithEmail(
                                            context,
                                            _model.emailTextController.text,
                                            _model.passwordTextController.text,
                                          );
                                      if (user == null) {
                                        return;
                                      }

                                      context.goNamedAuth(
                                        StartWidget.routeName,
                                        context.mounted,
                                      );
                                    },
                                    text: valueOrDefault<String>(
                                      _model.isCurrentUser
                                          ? 'Login'
                                          : 'Create Account',
                                      'Create Account',
                                    ),

                                    options: FFButtonOptions(
                                      width:
                                          MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 56.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0,
                                        0.0,
                                        0.0,
                                        0.0,
                                      ),

                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                            0.0,
                                            0.0,
                                            0.0,
                                            0.0,
                                          ),

                                      color: FlutterFlowTheme.of(
                                        context,
                                      ).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FlutterFlowTheme.of(
                                                context,
                                              ).titleMedium.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(
                                                context,
                                              ).titleMedium.fontStyle,
                                            ),

                                            color: FlutterFlowTheme.of(
                                              context,
                                            ).info,

                                            letterSpacing: 0.0,
                                            fontWeight: FlutterFlowTheme.of(
                                              context,
                                            ).titleMedium.fontWeight,
                                            fontStyle: FlutterFlowTheme.of(
                                              context,
                                            ).titleMedium.fontStyle,
                                          ),
                                      elevation: 2.0,

                                      borderRadius: BorderRadius.circular(28.0),
                                    ),
                                  );
                                }
                              },
                            ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                            ))
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  SizedBox(
                                    width: 30.0,
                                    child: Divider(
                                      thickness: 1.0,

                                      color: FlutterFlowTheme.of(
                                        context,
                                      ).alternate,
                                    ),
                                  ),
                                  Text(
                                    'or continue with',

                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FlutterFlowTheme.of(
                                              context,
                                            ).bodySmall.fontWeight,
                                            fontStyle: FlutterFlowTheme.of(
                                              context,
                                            ).bodySmall.fontStyle,
                                          ),

                                          color: FlutterFlowTheme.of(
                                            context,
                                          ).info,

                                          letterSpacing: 0.0,
                                          fontWeight: FlutterFlowTheme.of(
                                            context,
                                          ).bodySmall.fontWeight,
                                          fontStyle: FlutterFlowTheme.of(
                                            context,
                                          ).bodySmall.fontStyle,
                                        ),
                                  ),
                                  SizedBox(
                                    width: 30.0,
                                    child: Divider(
                                      thickness: 1.0,

                                      color: FlutterFlowTheme.of(
                                        context,
                                      ).alternate,
                                    ),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                            ))
                              Column(
                                mainAxisSize: MainAxisSize.max,

                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                        'CREATE_ACCOUNT_SIGN_IN_WITH_GOOGLE_BTN_O',
                                      );
                                      logFirebaseEvent('Button_auth');
                                      GoRouter.of(context).prepareAuthEvent();
                                      final user = await authManager
                                          .signInWithGoogle(context);
                                      if (user == null) {
                                        return;
                                      }

                                      context.goNamedAuth(
                                        StartWidget.routeName,
                                        context.mounted,
                                      );
                                    },
                                    text: 'Sign in with Google',
                                    icon: FaIcon(
                                      FontAwesomeIcons.google,

                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 56.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0,
                                        0.0,
                                        16.0,
                                        0.0,
                                      ),

                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                            16.0,
                                            0.0,
                                            8.0,
                                            0.0,
                                          ),
                                      iconColor: FlutterFlowTheme.of(
                                        context,
                                      ).primaryText,
                                      color: FlutterFlowTheme.of(
                                        context,
                                      ).secondaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FlutterFlowTheme.of(
                                                context,
                                              ).titleSmall.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(
                                                context,
                                              ).titleSmall.fontStyle,
                                            ),

                                            color: FlutterFlowTheme.of(
                                              context,
                                            ).primaryText,

                                            letterSpacing: 0.0,
                                            fontWeight: FlutterFlowTheme.of(
                                              context,
                                            ).titleSmall.fontWeight,
                                            fontStyle: FlutterFlowTheme.of(
                                              context,
                                            ).titleSmall.fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(
                                          context,
                                        ).alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(28.0),
                                    ),
                                  ),
                                  isAndroid
                                      ? Container()
                                      : FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                              'CREATE_ACCOUNT_SIGN_IN_WITH_APPLE_BTN_ON',
                                            );
                                            logFirebaseEvent('Button_auth');
                                            GoRouter.of(
                                              context,
                                            ).prepareAuthEvent();
                                            final user = await authManager
                                                .signInWithApple(context);
                                            if (user == null) {
                                              return;
                                            }

                                            context.goNamedAuth(
                                              StartWidget.routeName,
                                              context.mounted,
                                            );
                                          },
                                          text: 'Sign in with Apple',
                                          icon: FaIcon(
                                            FontAwesomeIcons.apple,

                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 56.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                  0.0,
                                                  0.0,
                                                  16.0,
                                                  0.0,
                                                ),

                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                  16.0,
                                                  0.0,
                                                  8.0,
                                                  0.0,
                                                ),
                                            iconColor: FlutterFlowTheme.of(
                                              context,
                                            ).primaryText,
                                            color: FlutterFlowTheme.of(
                                              context,
                                            ).secondaryBackground,
                                            textStyle:
                                                FlutterFlowTheme.of(
                                                  context,
                                                ).titleSmall.override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                          context,
                                                        ).titleSmall.fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                          context,
                                                        ).titleSmall.fontStyle,
                                                  ),

                                                  color: FlutterFlowTheme.of(
                                                    context,
                                                  ).primaryText,

                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                        context,
                                                      ).titleSmall.fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                        context,
                                                      ).titleSmall.fontStyle,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(
                                                context,
                                              ).alternate,
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              28.0,
                                            ),
                                          ),
                                        ),
                                ].divide(SizedBox(height: 20.0)),
                              ),
                          ].divide(SizedBox(height: 20.0)),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,

                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,

                        borderRadius: BorderRadius.circular(16.0),
                      ),

                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          24.0,
                          24.0,
                          24.0,
                          24.0,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,

                          children: [
                            Text(
                              'Why create an account?',

                              style: FlutterFlowTheme.of(context).headlineSmall
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(
                                        context,
                                      ).headlineSmall.fontStyle,
                                    ),

                                    color: FlutterFlowTheme.of(
                                      context,
                                    ).primaryText,

                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(
                                      context,
                                    ).headlineSmall.fontStyle,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,

                              children: [
                                Icon(
                                  Icons.save,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                                Text(
                                  'Save your progress and preferences',

                                  style: FlutterFlowTheme.of(context).bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FlutterFlowTheme.of(
                                            context,
                                          ).bodyMedium.fontWeight,
                                          fontStyle: FlutterFlowTheme.of(
                                            context,
                                          ).bodyMedium.fontStyle,
                                        ),

                                        color: FlutterFlowTheme.of(
                                          context,
                                        ).secondaryText,

                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,

                              children: [
                                Icon(
                                  Icons.sync,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                                Text(
                                  'Sync across multiple devices',

                                  style: FlutterFlowTheme.of(context).bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FlutterFlowTheme.of(
                                            context,
                                          ).bodyMedium.fontWeight,
                                          fontStyle: FlutterFlowTheme.of(
                                            context,
                                          ).bodyMedium.fontStyle,
                                        ),

                                        color: FlutterFlowTheme.of(
                                          context,
                                        ).secondaryText,

                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,

                              children: [
                                Icon(
                                  Icons.lock,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                                Text(
                                  'Secure your data and settings',

                                  style: FlutterFlowTheme.of(context).bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FlutterFlowTheme.of(
                                            context,
                                          ).bodyMedium.fontWeight,
                                          fontStyle: FlutterFlowTheme.of(
                                            context,
                                          ).bodyMedium.fontStyle,
                                        ),

                                        color: FlutterFlowTheme.of(
                                          context,
                                        ).secondaryText,

                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(
                                          context,
                                        ).bodyMedium.fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      0.0,
                      0.0,
                      40.0,
                    ),
                    child: Text(
                      'By creating an account, you agree to our Terms of Service and Privacy Policy',
                      textAlign: TextAlign.center,

                      style: FlutterFlowTheme.of(context).bodySmall.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(
                            context,
                          ).bodySmall.fontWeight,
                          fontStyle: FlutterFlowTheme.of(
                            context,
                          ).bodySmall.fontStyle,
                        ),

                        color: FlutterFlowTheme.of(context).secondaryText,

                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(
                          context,
                        ).bodySmall.fontWeight,
                        fontStyle: FlutterFlowTheme.of(
                          context,
                        ).bodySmall.fontStyle,
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

import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_popup_model.dart';
export 'login_popup_model.dart';

class LoginPopupWidget extends StatefulWidget {
  const LoginPopupWidget({super.key});

  @override
  State<LoginPopupWidget> createState() => _LoginPopupWidgetState();
}

class _LoginPopupWidgetState extends State<LoginPopupWidget>
    with TickerProviderStateMixin {
  late LoginPopupModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPopupModel());

    _model.emailAddressTextController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,

        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 140.0),
            end: Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.9, 1.0),
            end: Offset(1.0, 1.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(-0.349, 0),
            end: Offset(0, 0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(maxWidth: 570.0),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,

            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(0.0, 2.0),
              ),
            ],

            borderRadius: BorderRadius.circular(12.0),
          ),

          child: Padding(
            padding: EdgeInsets.all(32.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,

                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      0.0,
                      0.0,
                      16.0,
                    ),
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,

                      style: FlutterFlowTheme.of(context).displaySmall.override(
                        font: GoogleFonts.readexPro(
                          fontWeight: FlutterFlowTheme.of(
                            context,
                          ).displaySmall.fontWeight,
                          fontStyle: FlutterFlowTheme.of(
                            context,
                          ).displaySmall.fontStyle,
                        ),

                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(
                          context,
                        ).displaySmall.fontWeight,
                        fontStyle: FlutterFlowTheme.of(
                          context,
                        ).displaySmall.fontStyle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      0.0,
                      0.0,
                      16.0,
                    ),
                    child: Container(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.emailAddressTextController,
                        focusNode: _model.emailAddressFocusNode,

                        autofocus: true,

                        autofillHints: [AutofillHints.email],

                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: FlutterFlowTheme.of(context).labelLarge
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(
                                    context,
                                  ).labelLarge.fontWeight,
                                  fontStyle: FlutterFlowTheme.of(
                                    context,
                                  ).labelLarge.fontStyle,
                                ),

                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(
                                  context,
                                ).labelLarge.fontWeight,
                                fontStyle: FlutterFlowTheme.of(
                                  context,
                                ).labelLarge.fontStyle,
                              ),

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(
                                context,
                              ).primaryBackground,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor: FlutterFlowTheme.of(
                            context,
                          ).primaryBackground,
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
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

                        keyboardType: TextInputType.emailAddress,

                        validator: _model.emailAddressTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      0.0,
                      0.0,
                      16.0,
                    ),
                    child: Container(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.passwordTextController,
                        focusNode: _model.passwordFocusNode,

                        autofocus: true,

                        autofillHints: [AutofillHints.password],

                        obscureText: !_model.passwordVisibility,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: FlutterFlowTheme.of(context).labelLarge
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(
                                    context,
                                  ).labelLarge.fontWeight,
                                  fontStyle: FlutterFlowTheme.of(
                                    context,
                                  ).labelLarge.fontStyle,
                                ),

                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(
                                  context,
                                ).labelLarge.fontWeight,
                                fontStyle: FlutterFlowTheme.of(
                                  context,
                                ).labelLarge.fontStyle,
                              ),

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(
                                context,
                              ).primaryBackground,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor: FlutterFlowTheme.of(
                            context,
                          ).primaryBackground,

                          suffixIcon: InkWell(
                            onTap: () async {
                              safeSetState(
                                () => _model.passwordVisibility =
                                    !_model.passwordVisibility,
                              );
                            },
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              _model.passwordVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
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

                        validator: _model.passwordTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      0.0,
                      0.0,
                      16.0,
                    ),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('LOGIN_POPUP_COMP_SIGN_IN_BTN_ON_TAP');
                        logFirebaseEvent('Button_auth');
                        GoRouter.of(context).prepareAuthEvent();

                        final user = await authManager.signInWithEmail(
                          context,
                          _model.emailAddressTextController.text,
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
                      text: 'Sign In',

                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 44.0,
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

                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context).titleSmall
                            .override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(
                                  context,
                                ).titleSmall.fontWeight,
                                fontStyle: FlutterFlowTheme.of(
                                  context,
                                ).titleSmall.fontStyle,
                              ),

                              color: Colors.white,

                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(
                                context,
                              ).titleSmall.fontWeight,
                              fontStyle: FlutterFlowTheme.of(
                                context,
                              ).titleSmall.fontStyle,
                            ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      16.0,
                      0.0,
                      16.0,
                      16.0,
                    ),
                    child: Text(
                      'Or sign in with',
                      textAlign: TextAlign.center,

                      style: FlutterFlowTheme.of(context).labelMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(
                            context,
                          ).labelMedium.fontWeight,
                          fontStyle: FlutterFlowTheme.of(
                            context,
                          ).labelMedium.fontStyle,
                        ),

                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(
                          context,
                        ).labelMedium.fontWeight,
                        fontStyle: FlutterFlowTheme.of(
                          context,
                        ).labelMedium.fontStyle,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      FlutterFlowIconButton(
                        borderRadius: 8.0,

                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).primary,

                        icon: FaIcon(
                          FontAwesomeIcons.google,
                          color: FlutterFlowTheme.of(context).info,
                          size: 24.0,
                        ),
                        showLoadingIndicator: true,
                        onPressed: () async {
                          logFirebaseEvent(
                            'LOGIN_POPUP_COMP_google_ICN_ON_TAP',
                          );
                          logFirebaseEvent('IconButton_auth');
                          GoRouter.of(context).prepareAuthEvent();
                          final user = await authManager.signInWithGoogle(
                            context,
                          );
                          if (user == null) {
                            return;
                          }

                          context.goNamedAuth(
                            StartWidget.routeName,
                            context.mounted,
                          );
                        },
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 8.0,

                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).primary,

                        icon: FaIcon(
                          FontAwesomeIcons.apple,
                          color: FlutterFlowTheme.of(context).info,
                          size: 24.0,
                        ),
                        showLoadingIndicator: true,
                        onPressed: () async {
                          logFirebaseEvent('LOGIN_POPUP_COMP_apple_ICN_ON_TAP');
                          logFirebaseEvent('IconButton_auth');
                          GoRouter.of(context).prepareAuthEvent();
                          final user = await authManager.signInWithApple(
                            context,
                          );
                          if (user == null) {
                            return;
                          }

                          context.goNamedAuth(
                            StartWidget.routeName,
                            context.mounted,
                          );
                        },
                      ),
                    ],
                  ),

                  // You will have to add an action on this rich text to go to your login page.
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      12.0,
                      0.0,
                      12.0,
                    ),
                    child: RichText(
                      textScaler: MediaQuery.of(context).textScaler,

                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Don\'t have an account?  ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'Sign Up here',
                            style: FlutterFlowTheme.of(context).bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(
                                      context,
                                    ).bodyMedium.fontStyle,
                                  ),

                                  color: FlutterFlowTheme.of(context).primary,

                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(
                                    context,
                                  ).bodyMedium.fontStyle,
                                ),
                          ),
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
      ),
    );
  }
}

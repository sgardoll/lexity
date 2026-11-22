import '/auth/firebase_auth/auth_util.dart';
import '/components/onboarding_tap_walkthrough_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'anon_login_model.dart';
export 'anon_login_model.dart';

class AnonLoginWidget extends StatefulWidget {
  const AnonLoginWidget({super.key});

  static String routeName = 'anonLogin';
  static String routePath = 'anonLogin';

  @override
  State<AnonLoginWidget> createState() => _AnonLoginWidgetState();
}

class _AnonLoginWidgetState extends State<AnonLoginWidget> {
  late AnonLoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnonLoginModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'anonLogin'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ANON_LOGIN_PAGE_anonLogin_ON_INIT_STATE');
      logFirebaseEvent('anonLogin_alert_dialog');
      await showDialog(
        barrierColor: FlutterFlowTheme.of(context).imageryOverlay,
        barrierDismissible: false,
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(dialogContext).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: OnboardingTapWalkthroughWidget(),
            ),
          );
        },
      );

      logFirebaseEvent('anonLogin_auth');
      GoRouter.of(context).prepareAuthEvent();
      final user = await authManager.signInAnonymously(context);
      if (user == null) {
        return;
      }
      logFirebaseEvent('anonLogin_navigate_to');

      context.goNamedAuth(StartWidget.routeName, context.mounted);
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
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).imageryNight,
        ),
      ),
    );
  }
}

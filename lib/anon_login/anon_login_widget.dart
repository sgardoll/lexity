import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'anon_login_model.dart';
export 'anon_login_model.dart';

class AnonLoginWidget extends StatefulWidget {
  const AnonLoginWidget({super.key});

  static String routeName = 'anonLogin';
  static String routePath = 'anonLogin';

  @override
  State<AnonLoginWidget> createState() => _AnonLoginWidgetState();
}

class _AnonLoginWidgetState extends State<AnonLoginWidget>
    with TickerProviderStateMixin {
  late AnonLoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnonLoginModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'anonLogin'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ANON_LOGIN_PAGE_anonLogin_ON_INIT_STATE');
      logFirebaseEvent('anonLogin_widget_animation');
      if (animationsMap['imageOnActionTriggerAnimation'] != null) {
        await animationsMap['imageOnActionTriggerAnimation']!.controller
            .forward(from: 0.0);
      }
      logFirebaseEvent('anonLogin_auth');
      GoRouter.of(context).prepareAuthEvent();
      final user = await authManager.signInAnonymously(context);
      if (user == null) {
        return;
      }

      context.goNamedAuth(StartWidget.routeName, context.mounted);
    });

    animationsMap.addAll({
      'imageOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,

            children: [
              Flexible(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child:
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/2nobg.png',
                          width: MediaQuery.sizeOf(context).width * 0.2,
                          height: MediaQuery.sizeOf(context).height * 0.2,
                          fit: BoxFit.contain,
                        ),
                      ).animateOnActionTrigger(
                        animationsMap['imageOnActionTriggerAnimation']!,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

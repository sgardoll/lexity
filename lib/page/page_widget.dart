import '/components/how_to_navigate_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'page_model.dart';
export 'page_model.dart';

class PageWidget extends StatefulWidget {
  const PageWidget({super.key});

  static String routeName = 'page';
  static String routePath = 'page';

  @override
  State<PageWidget> createState() => _PageWidgetState();
}

class _PageWidgetState extends State<PageWidget> {
  late PageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'page'});
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

        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,

        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,

            children: [
              wrapWithModel(
                model: _model.howToNavigateModel,
                updateCallback: () => safeSetState(() {}),

                child: HowToNavigateWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

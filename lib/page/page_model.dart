import '/components/how_to_navigate_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'page_widget.dart' show PageWidget;
import 'package:flutter/material.dart';

class PageModel extends FlutterFlowModel<PageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for HowToNavigate component.
  late HowToNavigateModel howToNavigateModel;

  @override
  void initState(BuildContext context) {
    howToNavigateModel = createModel(context, () => HowToNavigateModel());
  }

  @override
  void dispose() {
    howToNavigateModel.dispose();
  }
}

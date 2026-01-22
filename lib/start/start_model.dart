import '/components/front_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'start_widget.dart' show StartWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class StartModel extends FlutterFlowModel<StartWidget> {
  ///  Local state fields for this page.

  int cardIndex = 0;

  Color bgColor = Color(4293781727);

  bool frontOfCardShowing = true;

  Color previousBgColor = Color(4279244056);

  ///  State fields for stateful widgets in this page.

  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // Models for Front dynamic component.
  late FlutterFlowDynamicModels<FrontModel> frontModels;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
    frontModels = FlutterFlowDynamicModels(() => FrontModel());
  }

  @override
  void dispose() {
    frontModels.dispose();
  }
}

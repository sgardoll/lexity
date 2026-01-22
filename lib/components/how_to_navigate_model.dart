import '/flutter_flow/flutter_flow_util.dart';
import 'how_to_navigate_widget.dart' show HowToNavigateWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class HowToNavigateModel extends FlutterFlowModel<HowToNavigateWidget> {
  ///  Local state fields for this component.

  int currentCardIndex = 0;

  int totalCards = 4;

  ///  State fields for stateful widgets in this component.

  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
  }

  @override
  void dispose() {}
}

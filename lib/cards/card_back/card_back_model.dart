import '/flutter_flow/flutter_flow_util.dart';
import 'card_back_widget.dart' show CardBackWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class CardBackModel extends FlutterFlowModel<CardBackWidget> {
  ///  Local state fields for this component.

  bool isLiked = false;

  bool soundPlaying = false;

  ///  State fields for stateful widgets in this component.

  AudioPlayer? soundPlayer1;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for Slider widget.
  double? sliderValue;
  AudioPlayer? soundPlayer2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}

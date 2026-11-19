import '/flutter_flow/flutter_flow_util.dart';
import 'front_widget.dart' show FrontWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class FrontModel extends FlutterFlowModel<FrontWidget> {
  ///  Local state fields for this component.

  bool soundPlaying = false;

  ///  State fields for stateful widgets in this component.

  AudioPlayer? soundPlayer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

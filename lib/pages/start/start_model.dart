import '/backend/backend.dart';
import '/cards/card_back/card_back_widget.dart';
import '/cards/front/front_widget.dart';
import '/components/blank/blank_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'start_widget.dart' show StartWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StartModel extends FlutterFlowModel<StartWidget> {
  ///  Local state fields for this page.

  int cardIndex = 0;

  Color bgColor = Color(4293781727);

  bool frontOfCardShowing = true;

  Color previousBgColor = Color(4279244056);

  ///  State fields for stateful widgets in this page.

  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // Models for CardBack dynamic component.
  late FlutterFlowDynamicModels<CardBackModel> cardBackModels;
  // Models for Front dynamic component.
  late FlutterFlowDynamicModels<FrontModel> frontModels;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
    cardBackModels = FlutterFlowDynamicModels(() => CardBackModel());
    frontModels = FlutterFlowDynamicModels(() => FrontModel());
  }

  @override
  void dispose() {
    cardBackModels.dispose();
    frontModels.dispose();
  }
}

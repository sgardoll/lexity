import '/components/tutorial_card_copy_widget.dart';
import '/components/tutorial_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'onboarding_tap_walkthrough_widget.dart'
    show OnboardingTapWalkthroughWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OnboardingTapWalkthroughModel
    extends FlutterFlowModel<OnboardingTapWalkthroughWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for TutorialCardCopy component.
  late TutorialCardCopyModel tutorialCardCopyModel;
  // Model for TutorialCard.
  late TutorialCardModel tutorialCardModel1;
  // Model for TutorialCard.
  late TutorialCardModel tutorialCardModel2;
  // Model for TutorialCard.
  late TutorialCardModel tutorialCardModel3;

  @override
  void initState(BuildContext context) {
    tutorialCardCopyModel = createModel(context, () => TutorialCardCopyModel());
    tutorialCardModel1 = createModel(context, () => TutorialCardModel());
    tutorialCardModel2 = createModel(context, () => TutorialCardModel());
    tutorialCardModel3 = createModel(context, () => TutorialCardModel());
  }

  @override
  void dispose() {
    tutorialCardCopyModel.dispose();
    tutorialCardModel1.dispose();
    tutorialCardModel2.dispose();
    tutorialCardModel3.dispose();
  }
}

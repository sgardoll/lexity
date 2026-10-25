import '/components/tutorial_card_widget.dart';
import '/components/tutorial_cardw_logo_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'onboarding_tap_walkthrough_widget.dart'
    show OnboardingTapWalkthroughWidget;
import 'package:flutter/material.dart';

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
  // Model for TutorialCardwLogo component.
  late TutorialCardwLogoModel tutorialCardwLogoModel;
  // Model for TutorialCard.
  late TutorialCardModel tutorialCardModel1;
  // Model for TutorialCard.
  late TutorialCardModel tutorialCardModel2;
  // Model for TutorialCard.
  late TutorialCardModel tutorialCardModel3;

  @override
  void initState(BuildContext context) {
    tutorialCardwLogoModel =
        createModel(context, () => TutorialCardwLogoModel());
    tutorialCardModel1 = createModel(context, () => TutorialCardModel());
    tutorialCardModel2 = createModel(context, () => TutorialCardModel());
    tutorialCardModel3 = createModel(context, () => TutorialCardModel());
  }

  @override
  void dispose() {
    tutorialCardwLogoModel.dispose();
    tutorialCardModel1.dispose();
    tutorialCardModel2.dispose();
    tutorialCardModel3.dispose();
  }
}

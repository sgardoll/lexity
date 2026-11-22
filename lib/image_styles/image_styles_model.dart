import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'image_styles_widget.dart' show ImageStylesWidget;
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ImageStylesModel extends FlutterFlowModel<ImageStylesWidget> {
  ///  Local state fields for this page.

  String? selectedStyle = '';

  ///  State fields for stateful widgets in this page.

  // State field(s) for ImageryPreview widget.
  PageController? imageryPreviewController;

  int get imageryPreviewCurrentIndex => imageryPreviewController != null &&
          imageryPreviewController!.hasClients &&
          imageryPreviewController!.page != null
      ? imageryPreviewController!.page!.round()
      : 0;
  // State field(s) for customStyleField widget.
  FocusNode? customStyleFieldFocusNode;
  TextEditingController? customStyleFieldTextController;
  String? Function(BuildContext, String?)?
      customStyleFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    customStyleFieldFocusNode?.dispose();
    customStyleFieldTextController?.dispose();
  }
}

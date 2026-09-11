// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cached_network_image/cached_network_image.dart';

Future<void> precacheLexiconImage(String imageUrl) async {
  if (imageUrl.isEmpty) {
    return;
  }

  final stream =
      CachedNetworkImageProvider(imageUrl).resolve(const ImageConfiguration());
  late ImageStreamListener listener;
  listener = ImageStreamListener(
    (image, synchronousCall) => stream.removeListener(listener),
    onError: (error, stackTrace) => stream.removeListener(listener),
  );
  stream.addListener(listener);
}

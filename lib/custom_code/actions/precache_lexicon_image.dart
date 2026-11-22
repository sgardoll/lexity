// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cached_network_image/cached_network_image.dart';

Future precacheLexiconImage(
  List<LexiconRecord>? lexicon,
  LexiconRecord? swiped,
) async {
  if (lexicon == null || lexicon.length < 2 || swiped == null) {
    return;
  }
  final index = lexicon.indexWhere((doc) => doc.reference == swiped.reference);
  if (index < 0) {
    return;
  }

  void warm(String url) {
    final stream =
        CachedNetworkImageProvider(url).resolve(const ImageConfiguration());
    late ImageStreamListener listener;
    listener = ImageStreamListener(
      (image, synchronousCall) => stream.removeListener(listener),
      onError: (error, stackTrace) => stream.removeListener(listener),
    );
    stream.addListener(listener);
  }

  // The card under the swiped one is already building; warm it and the one
  // after, so a fast second swipe also lands on a decoded image.
  final ahead = lexicon.length - 1 < 2 ? lexicon.length - 1 : 2;
  for (var step = 1; step <= ahead; step++) {
    final url = lexicon[(index + step) % lexicon.length].imageUrl;
    if (url.isEmpty) {
      continue;
    }
    // Same key Front's OctoImage uses: getCORSProxyUrl(imageUrl).
    warm(getCORSProxyUrl(url));
  }
}

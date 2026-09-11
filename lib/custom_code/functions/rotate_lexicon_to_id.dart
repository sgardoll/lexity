import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

/// Rotates the queried lexicon so the document matching a Start page ID is
/// the first card.
List<LexiconRecord>? rotateLexiconToId(
  List<LexiconRecord>? lexicon,
  String? id,
) {
  if (lexicon == null || lexicon.isEmpty || id == null || id.isEmpty) {
    return lexicon ?? [];
  }

  final index = lexicon.indexWhere((document) => document.reference.id == id);
  if (index <= 0) {
    return lexicon;
  }

  return [
    ...lexicon.sublist(index),
    ...lexicon.sublist(0, index),
  ];
}

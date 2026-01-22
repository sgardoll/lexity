// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ColoursStruct extends FFFirebaseStruct {
  ColoursStruct({
    String? vibrant,
    String? lightVibrant,
    String? darkVibrant,
    String? muted,
    String? lightMuted,
    String? darkMuted,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  }) : _vibrant = vibrant,
       _lightVibrant = lightVibrant,
       _darkVibrant = darkVibrant,
       _muted = muted,
       _lightMuted = lightMuted,
       _darkMuted = darkMuted,
       super(firestoreUtilData);

  // "Vibrant" field.
  String? _vibrant;
  String get vibrant => _vibrant ?? '';
  set vibrant(String? val) => _vibrant = val;

  bool hasVibrant() => _vibrant != null;

  // "LightVibrant" field.
  String? _lightVibrant;
  String get lightVibrant => _lightVibrant ?? '';
  set lightVibrant(String? val) => _lightVibrant = val;

  bool hasLightVibrant() => _lightVibrant != null;

  // "DarkVibrant" field.
  String? _darkVibrant;
  String get darkVibrant => _darkVibrant ?? '';
  set darkVibrant(String? val) => _darkVibrant = val;

  bool hasDarkVibrant() => _darkVibrant != null;

  // "Muted" field.
  String? _muted;
  String get muted => _muted ?? '';
  set muted(String? val) => _muted = val;

  bool hasMuted() => _muted != null;

  // "LightMuted" field.
  String? _lightMuted;
  String get lightMuted => _lightMuted ?? '';
  set lightMuted(String? val) => _lightMuted = val;

  bool hasLightMuted() => _lightMuted != null;

  // "DarkMuted" field.
  String? _darkMuted;
  String get darkMuted => _darkMuted ?? '';
  set darkMuted(String? val) => _darkMuted = val;

  bool hasDarkMuted() => _darkMuted != null;

  static ColoursStruct fromMap(Map<String, dynamic> data) => ColoursStruct(
    vibrant: data['Vibrant'] as String?,
    lightVibrant: data['LightVibrant'] as String?,
    darkVibrant: data['DarkVibrant'] as String?,
    muted: data['Muted'] as String?,
    lightMuted: data['LightMuted'] as String?,
    darkMuted: data['DarkMuted'] as String?,
  );

  static ColoursStruct? maybeFromMap(dynamic data) =>
      data is Map ? ColoursStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
    'Vibrant': _vibrant,
    'LightVibrant': _lightVibrant,
    'DarkVibrant': _darkVibrant,
    'Muted': _muted,
    'LightMuted': _lightMuted,
    'DarkMuted': _darkMuted,
  }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
    'Vibrant': serializeParam(_vibrant, ParamType.String),
    'LightVibrant': serializeParam(_lightVibrant, ParamType.String),
    'DarkVibrant': serializeParam(_darkVibrant, ParamType.String),
    'Muted': serializeParam(_muted, ParamType.String),
    'LightMuted': serializeParam(_lightMuted, ParamType.String),
    'DarkMuted': serializeParam(_darkMuted, ParamType.String),
  }.withoutNulls;

  static ColoursStruct fromSerializableMap(
    Map<String, dynamic> data,
  ) => ColoursStruct(
    vibrant: deserializeParam(data['Vibrant'], ParamType.String, false),
    lightVibrant: deserializeParam(
      data['LightVibrant'],
      ParamType.String,
      false,
    ),
    darkVibrant: deserializeParam(data['DarkVibrant'], ParamType.String, false),
    muted: deserializeParam(data['Muted'], ParamType.String, false),
    lightMuted: deserializeParam(data['LightMuted'], ParamType.String, false),
    darkMuted: deserializeParam(data['DarkMuted'], ParamType.String, false),
  );

  @override
  String toString() => 'ColoursStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ColoursStruct &&
        vibrant == other.vibrant &&
        lightVibrant == other.lightVibrant &&
        darkVibrant == other.darkVibrant &&
        muted == other.muted &&
        lightMuted == other.lightMuted &&
        darkMuted == other.darkMuted;
  }

  @override
  int get hashCode => const ListEquality().hash([
    vibrant,
    lightVibrant,
    darkVibrant,
    muted,
    lightMuted,
    darkMuted,
  ]);
}

ColoursStruct createColoursStruct({
  String? vibrant,
  String? lightVibrant,
  String? darkVibrant,
  String? muted,
  String? lightMuted,
  String? darkMuted,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) => ColoursStruct(
  vibrant: vibrant,
  lightVibrant: lightVibrant,
  darkVibrant: darkVibrant,
  muted: muted,
  lightMuted: lightMuted,
  darkMuted: darkMuted,
  firestoreUtilData: FirestoreUtilData(
    clearUnsetFields: clearUnsetFields,
    create: create,
    delete: delete,
    fieldValues: fieldValues,
  ),
);

ColoursStruct? updateColoursStruct(
  ColoursStruct? colours, {
  bool clearUnsetFields = true,
  bool create = false,
}) => colours
  ?..firestoreUtilData = FirestoreUtilData(
    clearUnsetFields: clearUnsetFields,
    create: create,
  );

void addColoursStructData(
  Map<String, dynamic> firestoreData,
  ColoursStruct? colours,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (colours == null) {
    return;
  }
  if (colours.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && colours.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final coloursData = getColoursFirestoreData(colours, forFieldValue);
  final nestedData = coloursData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = colours.firestoreUtilData.create || clearFields;
  firestoreData.addAll(
    mergeFields ? mergeNestedFields(nestedData) : nestedData,
  );
}

Map<String, dynamic> getColoursFirestoreData(
  ColoursStruct? colours, [
  bool forFieldValue = false,
]) {
  if (colours == null) {
    return {};
  }
  final firestoreData = mapToFirestore(colours.toMap());

  // Add any Firestore field values
  colours.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getColoursListFirestoreData(
  List<ColoursStruct>? colourss,
) => colourss?.map((e) => getColoursFirestoreData(e, true)).toList() ?? [];

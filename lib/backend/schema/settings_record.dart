import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SettingsRecord extends FirestoreRecord {
  SettingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "soundOn" field.
  bool? _soundOn;
  bool get soundOn => _soundOn ?? false;
  bool hasSoundOn() => _soundOn != null;

  // "notificationsOn" field.
  bool? _notificationsOn;
  bool get notificationsOn => _notificationsOn ?? false;
  bool hasNotificationsOn() => _notificationsOn != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _soundOn = snapshotData['soundOn'] as bool?;
    _notificationsOn = snapshotData['notificationsOn'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('settings');

  static Stream<SettingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SettingsRecord.fromSnapshot(s));

  static Future<SettingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SettingsRecord.fromSnapshot(s));

  static SettingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SettingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SettingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SettingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SettingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SettingsRecord && reference.path == other.reference.path;
}

Map<String, dynamic> createSettingsRecordData({
  String? uid,
  bool? soundOn,
  bool? notificationsOn,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'soundOn': soundOn,
      'notificationsOn': notificationsOn,
    }.withoutNulls,
  );

  return firestoreData;
}

class SettingsRecordDocumentEquality implements Equality<SettingsRecord> {
  const SettingsRecordDocumentEquality();

  @override
  bool equals(SettingsRecord? e1, SettingsRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.soundOn == e2?.soundOn &&
        e1?.notificationsOn == e2?.notificationsOn;
  }

  @override
  int hash(SettingsRecord? e) =>
      const ListEquality().hash([e?.uid, e?.soundOn, e?.notificationsOn]);

  @override
  bool isValidKey(Object? o) => o is SettingsRecord;
}

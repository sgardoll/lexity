import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LexiconRecord extends FirestoreRecord {
  LexiconRecord._(DocumentReference reference, Map<String, dynamic> data)
    : super(reference, data) {
    _initializeFields();
  }

  // "definition" field.
  String? _definition;
  String get definition => _definition ?? '';
  bool hasDefinition() => _definition != null;

  // "etymology" field.
  String? _etymology;
  String get etymology => _etymology ?? '';
  bool hasEtymology() => _etymology != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  bool hasLanguage() => _language != null;

  // "partOfSpeech" field.
  String? _partOfSpeech;
  String get partOfSpeech => _partOfSpeech ?? '';
  bool hasPartOfSpeech() => _partOfSpeech != null;

  // "pronunciation" field.
  String? _pronunciation;
  String get pronunciation => _pronunciation ?? '';
  bool hasPronunciation() => _pronunciation != null;

  // "term" field.
  String? _term;
  String get term => _term ?? '';
  bool hasTerm() => _term != null;

  // "usage" field.
  String? _usage;
  String get usage => _usage ?? '';
  bool hasUsage() => _usage != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "colours" field.
  ColoursStruct? _colours;
  ColoursStruct get colours => _colours ?? ColoursStruct();
  bool hasColours() => _colours != null;

  // "antonyms" field.
  List<String>? _antonyms;
  List<String> get antonyms => _antonyms ?? const [];
  bool hasAntonyms() => _antonyms != null;

  // "relatedWords" field.
  List<String>? _relatedWords;
  List<String> get relatedWords => _relatedWords ?? const [];
  bool hasRelatedWords() => _relatedWords != null;

  // "synonyms" field.
  List<String>? _synonyms;
  List<String> get synonyms => _synonyms ?? const [];
  bool hasSynonyms() => _synonyms != null;

  // "likedBy" field.
  List<DocumentReference>? _likedBy;
  List<DocumentReference> get likedBy => _likedBy ?? const [];
  bool hasLikedBy() => _likedBy != null;

  // "sharedBy" field.
  List<DocumentReference>? _sharedBy;
  List<DocumentReference> get sharedBy => _sharedBy ?? const [];
  bool hasSharedBy() => _sharedBy != null;

  // "creationDate" field.
  String? _creationDate;
  String get creationDate => _creationDate ?? '';
  bool hasCreationDate() => _creationDate != null;

  // "usageSpoken" field.
  String? _usageSpoken;
  String get usageSpoken => _usageSpoken ?? '';
  bool hasUsageSpoken() => _usageSpoken != null;

  // "blurhash" field.
  String? _blurhash;
  String get blurhash => _blurhash ?? '';
  bool hasBlurhash() => _blurhash != null;

  // "rarityScore" field.
  double? _rarityScore;
  double get rarityScore => _rarityScore ?? 0.0;
  bool hasRarityScore() => _rarityScore != null;

  void _initializeFields() {
    _definition = snapshotData['definition'] as String?;
    _etymology = snapshotData['etymology'] as String?;
    _language = snapshotData['language'] as String?;
    _partOfSpeech = snapshotData['partOfSpeech'] as String?;
    _pronunciation = snapshotData['pronunciation'] as String?;
    _term = snapshotData['term'] as String?;
    _usage = snapshotData['usage'] as String?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _colours = snapshotData['colours'] is ColoursStruct
        ? snapshotData['colours']
        : ColoursStruct.maybeFromMap(snapshotData['colours']);
    _antonyms = getDataList(snapshotData['antonyms']);
    _relatedWords = getDataList(snapshotData['relatedWords']);
    _synonyms = getDataList(snapshotData['synonyms']);
    _likedBy = getDataList(snapshotData['likedBy']);
    _sharedBy = getDataList(snapshotData['sharedBy']);
    _creationDate = snapshotData['creationDate'] as String?;
    _usageSpoken = snapshotData['usageSpoken'] as String?;
    _blurhash = snapshotData['blurhash'] as String?;
    _rarityScore = castToType<double>(snapshotData['rarityScore']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lexicon');

  static Stream<LexiconRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LexiconRecord.fromSnapshot(s));

  static Future<LexiconRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LexiconRecord.fromSnapshot(s));

  static LexiconRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LexiconRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LexiconRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) => LexiconRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LexiconRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LexiconRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLexiconRecordData({
  String? definition,
  String? etymology,
  String? language,
  String? partOfSpeech,
  String? pronunciation,
  String? term,
  String? usage,
  String? imageUrl,
  ColoursStruct? colours,
  String? creationDate,
  String? usageSpoken,
  String? blurhash,
  double? rarityScore,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'definition': definition,
      'etymology': etymology,
      'language': language,
      'partOfSpeech': partOfSpeech,
      'pronunciation': pronunciation,
      'term': term,
      'usage': usage,
      'imageUrl': imageUrl,
      'colours': ColoursStruct().toMap(),
      'creationDate': creationDate,
      'usageSpoken': usageSpoken,
      'blurhash': blurhash,
      'rarityScore': rarityScore,
    }.withoutNulls,
  );

  // Handle nested data for "colours" field.
  addColoursStructData(firestoreData, colours, 'colours');

  return firestoreData;
}

class LexiconRecordDocumentEquality implements Equality<LexiconRecord> {
  const LexiconRecordDocumentEquality();

  @override
  bool equals(LexiconRecord? e1, LexiconRecord? e2) {
    const listEquality = ListEquality();
    return e1?.definition == e2?.definition &&
        e1?.etymology == e2?.etymology &&
        e1?.language == e2?.language &&
        e1?.partOfSpeech == e2?.partOfSpeech &&
        e1?.pronunciation == e2?.pronunciation &&
        e1?.term == e2?.term &&
        e1?.usage == e2?.usage &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.colours == e2?.colours &&
        listEquality.equals(e1?.antonyms, e2?.antonyms) &&
        listEquality.equals(e1?.relatedWords, e2?.relatedWords) &&
        listEquality.equals(e1?.synonyms, e2?.synonyms) &&
        listEquality.equals(e1?.likedBy, e2?.likedBy) &&
        listEquality.equals(e1?.sharedBy, e2?.sharedBy) &&
        e1?.creationDate == e2?.creationDate &&
        e1?.usageSpoken == e2?.usageSpoken &&
        e1?.blurhash == e2?.blurhash &&
        e1?.rarityScore == e2?.rarityScore;
  }

  @override
  int hash(LexiconRecord? e) => const ListEquality().hash([
    e?.definition,
    e?.etymology,
    e?.language,
    e?.partOfSpeech,
    e?.pronunciation,
    e?.term,
    e?.usage,
    e?.imageUrl,
    e?.colours,
    e?.antonyms,
    e?.relatedWords,
    e?.synonyms,
    e?.likedBy,
    e?.sharedBy,
    e?.creationDate,
    e?.usageSpoken,
    e?.blurhash,
    e?.rarityScore,
  ]);

  @override
  bool isValidKey(Object? o) => o is LexiconRecord;
}

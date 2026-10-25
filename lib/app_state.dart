import 'package:flutter/material.dart'
    show ChangeNotifier, Color, Colors, VoidCallback;
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _isSoundOn = prefs.getBool('ff_isSoundOn') ?? _isSoundOn;
    });
    _safeInit(() {
      _showHowToNavigate =
          prefs.getBool('ff_showHowToNavigate') ?? _showHowToNavigate;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _isSoundOn = true;
  bool get isSoundOn => _isSoundOn;
  set isSoundOn(bool value) {
    _isSoundOn = value;
    prefs.setBool('ff_isSoundOn', value);
  }

  bool _showHowToNavigate = true;
  bool get showHowToNavigate => _showHowToNavigate;
  set showHowToNavigate(bool value) {
    _showHowToNavigate = value;
    prefs.setBool('ff_showHowToNavigate', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

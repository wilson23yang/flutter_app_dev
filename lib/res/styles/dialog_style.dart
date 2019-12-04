import 'package:flutter/material.dart';

class DialogStyle {
  DialogStyle();

  static DialogStyle _instance;

  static DialogStyle instance() => _getInstance();

  static DialogStyle _getInstance() {
    if (_instance == null) {
      _instance = DialogStyle();
    }
    return _instance;
  }

  static void initDimen() {
    _instance = null;
    _instance = DialogStyle();
  }


}

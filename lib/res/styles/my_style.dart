import 'package:flutter/material.dart';

class MyStyle {
  MyStyle();

  static MyStyle _instance;

  static MyStyle instance() => _getInstance();

  static MyStyle _getInstance() {
    if (_instance == null) {
      _instance = MyStyle();
    }
    return _instance;
  }

  static void initDimen() {
    _instance = null;
    _instance = MyStyle();
  }


  TextStyle get textMyHeadNameStyle => TextStyle(
    color: Colors.red,
    fontSize: 19,
    fontWeight: FontWeight.bold,
  );



}

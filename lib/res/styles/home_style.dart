import 'package:flutter/material.dart';

class HomeStyle {
  HomeStyle();

  static HomeStyle _instance;

  static HomeStyle instance() => _getInstance();

  static HomeStyle _getInstance() {
    if (_instance == null) {
      _instance = HomeStyle();
    }
    return _instance;
  }

  static void initDimen() {
    _instance = null;
    _instance = HomeStyle();
  }


}

import 'dart:async';
import 'dart:ui';
import 'package:app_dev/infrastructures/redux/app_state.dart';
import 'package:app_dev/view/my/state_my.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sprintf/sprintf.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageView createState() => _MyPageView();
}

class _MyPageView extends MyState {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store>(converter: (Store<AppState> store) {
      return store;
    }, builder: (BuildContext context, Store store) {
      return Container(
        child: Center(
          child: Text('mine'),
        ),
      );
    });
  }


}

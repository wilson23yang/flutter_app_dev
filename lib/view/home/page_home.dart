import 'package:app_dev/config/module_config.dart';
import 'package:app_dev/infrastructures/redux/app_state.dart';
import 'package:app_dev/view/home/state_home.dart';
import 'package:app_dev/view/main/state_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class HomePage extends StatefulWidget {

  HomePage();

  @override
  _HomePageView createState() => _HomePageView();
}

class _HomePageView extends HomeState {

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
      builder: (BuildContext context, Store<AppState> store) {
        return Container(
          child: Center(
            child: Text('home'),
          ),
        );
      },
      converter: (Store<AppState> store) {
        return store;
      },
    );
  }

}

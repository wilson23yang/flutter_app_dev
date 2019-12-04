import 'package:app_dev/infrastructures/redux/app_state.dart';
import 'package:app_dev/view/login/state_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class LoginPage extends StatefulWidget {
  final ValueChanged<bool> loginCallback; // 登录完成之后的回调，参数成功或者失败

  LoginPage({this.loginCallback});

  @override
  _LoginPageView createState() => _LoginPageView();
}

class _LoginPageView extends LoginState {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
      converter: (Store<AppState> store) {
        return store;
      },
      builder: (BuildContext context, Store store) {
        return Container();
      });
  }

}

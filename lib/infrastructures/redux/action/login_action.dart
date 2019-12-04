import 'package:flutter/material.dart';

///发起登录
class StartLoginAction {
  final BuildContext context;
  final String phone;
  final String userName;
  final String password;
  final String response;
  final ValueChanged<bool> afterLogin;

  StartLoginAction(this.context,{this.phone, this.password,this.userName, this.afterLogin,this.response});
}


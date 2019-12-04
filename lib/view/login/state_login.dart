import 'package:app_dev/view/login/page_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

abstract class LoginState extends State<LoginPage> {
  var phoneNode = FocusNode();
  var passwordNode = FocusNode();

  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  var passwordViewState = true;

  var phoneClearShow = false;

  bool keyboardIsVisibility = false;

  @override
  void initState() {
    super.initState();
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        keyboardIsVisibility = visible;
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }

}

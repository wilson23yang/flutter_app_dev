import "dart:core";

import 'package:app_dev/view/home/page_home.dart';
import 'package:app_dev/view/login/page_login.dart';
import 'package:app_dev/view/main/page_main.dart';
import 'package:app_dev/view/my/page_my.dart';
import 'package:fluro/fluro.dart';
import "package:flutter/material.dart";

// 路由管理,页面需要注册
Map<String, Handler> handlers = {
  '/main': Handler(handlerFunc: (BuildContext context, _) {
    return MainPage(context);
  }),
  '/home': Handler(handlerFunc: (BuildContext context, _) {
    return HomePage();
  }),
  '/login': Handler(handlerFunc: (BuildContext context, _) {
    return LoginPage();
  }),
  '/my': Handler(handlerFunc: (BuildContext context, _) {
    return MyPage();
  }),
};


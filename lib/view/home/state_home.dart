import 'package:app_dev/config/module_config.dart';
import 'package:app_dev/view/home/page_home.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

///订阅Tab页面切换消息，接收目标ModuleKey
PublishSubject<ModuleKey> mainPageChangeTabNotice;

///
abstract class HomeState extends State<HomePage> {


  //当前导航界面索引
  int currentTabIndex;

  List<Module> modules = ModuleConfig.loadModule();


  PageController pageController;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

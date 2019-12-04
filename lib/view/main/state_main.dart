import 'package:app_dev/config/module_config.dart';
import 'package:app_dev/utils/adaptive_util.dart';
import 'package:app_dev/view/main/page_main.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

///订阅Tab页面切换消息，接收目标ModuleKey
PublishSubject<ModuleKey> mainPageChangeTabNotice;

///
abstract class MainState extends State<MainPage> {


  //当前导航界面索引
  int currentTabIndex;

  List<Module> modules = ModuleConfig.loadModule();


  PageController pageController;


  @override
  void initState() {
    super.initState();

    if(mainPageChangeTabNotice == null){
      mainPageChangeTabNotice = PublishSubject<ModuleKey>();
    }
    mainPageChangeTabNotice.stream.listen((moduleKey){
      changeCurrentTab(ModuleConfig.getTabIndex(moduleKey));
    });

    pageController =
        PageController(initialPage: widget.mainTabIndex ?? ModuleConfig.getTabIndex(ModuleKey.home));
    currentTabIndex = widget.mainTabIndex ?? ModuleConfig.getTabIndex(ModuleKey.home);
  }

  @override
  void dispose() {
    pageController.dispose();
    mainPageChangeTabNotice?.close();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 初始化全局Size
    Adaptive.size = MediaQuery.of(context).size;
    Adaptive.devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
  }



  bool isLogin = true;
  /// 切换当前底部导航Tab
  void changeCurrentTab(int index) {
    //未登录
    if (!isLogin) {
      Navigator.of(context).pushNamed("/login");
    } else {
      setState(() {
        currentTabIndex = index;
        pageController.jumpTo(Adaptive.size.width * index);
      });
    }
  }

  int lastClick = 0;
  ///双击退出App
  bool doubleClickBack() {
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now - lastClick > 800) {
      lastClick = DateTime.now().millisecondsSinceEpoch;
      return false;
    } else {
      return true;
    }
  }
}

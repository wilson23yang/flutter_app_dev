import 'package:app_dev/res/images/image_theme.dart';
import 'package:app_dev/res/localizations/localizations.dart';
import 'package:app_dev/res/localizations/wrapper/string_wrapper.dart';
import 'package:app_dev/utils/adaptive_util.dart';
import 'package:app_dev/view/home/page_home.dart';
import 'package:app_dev/view/my/page_my.dart';
import 'package:app_dev/view/widget/persist_tabview.dart';
import 'package:flutter/material.dart';

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

///配置应用编译类型： APP
class AppBuildTypeConfig{
  static AppType buildType = AppType.demoApp;
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

///
typedef ModuleEntrance = Function(BuildContext context,{dynamic p1,dynamic p2,dynamic p3});

///模块
class Module{
  ModuleKey key;
  StringWrapper name;//模块名
  String icon;
  String iconPress;
  String icon2;
  String icon2Press;
  String desc;//模块描述信息
  ModuleEntrance entrance;//模块入口

  Module(this.key,{this.name,this.icon,this.iconPress,this.icon2,this.icon2Press,this.desc,this.entrance});
}


///模块key用于查询块在tab列表中的排序位置
enum ModuleKey{
  home,mine,dev
}


///app类型
enum AppType{
  demoApp
}

///模块定义与配置
class ModuleConfig{
  ///首页
  static Module _home = Module(
    ModuleKey.home,
    name: StringWrapper((context) => MyLocalizations.of(context).home),
    desc: 'home',
    icon: ImageTheme.instance().nav_home_n,
    iconPress: ImageTheme.instance().nav_home_p,
    entrance: (context,{p1,p2,p3}) => HomePage(),
  );

  ///我的
  static Module _mine = Module(
    ModuleKey.mine,
    name: StringWrapper((context) => MyLocalizations.of(context).mime),
    desc: 'mine',
    icon: ImageTheme.instance().nav_my_n,
    iconPress: ImageTheme.instance().nav_my_p,
    entrance: (context,{p1,p2,p3}) => MyPage(),
  );

  ///我的
  static Module _dev = Module(
    ModuleKey.dev,
    name: StringWrapper((context) => 'dev'),
    desc: 'mine',
    icon: ImageTheme.instance().nav_my_n,
    iconPress: ImageTheme.instance().nav_my_p,
    entrance: (context,{p1,p2,p3}) => MyPage(),
  );


  ///app模块
  static List<Module> _modules = [_home,_dev,_mine];

  static const int initTabIndex = 0;

  ///加载指定的模块
  static List<Module> loadModule(){
    switch(AppBuildTypeConfig.buildType){
      case AppType.demoApp:
        return _modules;
        break;
      default:
        return _modules;
    }
  }

  ///模块在tab中的排序
  static int getTabIndex(ModuleKey key){
    return loadModule().indexWhere((module) => module.key == key);
  }
  

  static Widget buildPageTabView(BuildContext context,Module module,{dynamic p1,dynamic p2,dynamic p3}){
    switch (module.key) {
      case ModuleKey.home:
        return PersistTabView(child: module.entrance(context, p1: p1,p2:p2,p3:p3));
        break;
      case ModuleKey.mine:
        return PersistTabView(child: module.entrance(context, p1: p1,p2:p2,p3:p3));
        break;
      case ModuleKey.dev:
        return PersistTabView(child: module.entrance(context, p1: p1,p2:p2,p3:p3));
        break;
      default:
        return null;
        break;
    }
  }
  
  static BottomNavigationBarItem buildNavigationBarView(BuildContext context,Module module,int currentTabIndex,int defaultIndex,){
    switch (module.key) {
      case ModuleKey.home:
        return _buildBottomBarItem(context,module,currentTabIndex,defaultIndex, module.icon, module.iconPress);
        break;
      case ModuleKey.mine:
        return _buildBottomBarItem(context,module,currentTabIndex,defaultIndex,  module.icon,module.iconPress);
        break;
      case ModuleKey.dev:
        return _buildBottomBarItem(context,module,currentTabIndex,defaultIndex,  module.icon,module.iconPress);
        break;
      default:
        return null;
        break;
    }
  }

  static BottomNavigationBarItem _buildBottomBarItem(BuildContext context,Module module,int currentTabIndex,int defaultIndex, String normal, String press) {
    return BottomNavigationBarItem(
      icon: currentTabIndex == defaultIndex
          ? _buildBottomBarIcon(press)
          : _buildBottomBarIcon(normal),
      title: _buildBottomBarText(module.name.get(context)),
    );
  }

 static  Widget _buildBottomBarIcon(String imageAddress) {
    return Padding(
      padding: EdgeInsets.only(top: Adaptive.width(0.0)),
      child: Image.asset(imageAddress),
    );
  }

  static Widget _buildBottomBarText(String name) {
    return Text(name, style: TextStyle(fontSize: Adaptive.width(9)));
  }

}


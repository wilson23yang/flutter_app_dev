import 'dart:io';

import 'package:app_dev/config/module_config.dart';
import 'package:app_dev/infrastructures/redux/app_state.dart';
import 'package:app_dev/res/colors/color_theme.dart';
import 'package:app_dev/view/main/state_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class MainPage extends StatefulWidget {
  //AppStore
  final Store<AppState> store;

  //mainTabIndex
  final int mainTabIndex;


  //交易市场
  final String payMarket;

  //交易Coin
  final String tradeMarket;


  final BuildContext ctx;

  MainPage(this.ctx,
      {this.store,
      this.mainTabIndex = ModuleConfig.initTabIndex,
      this.payMarket,
      this.tradeMarket});

  @override
  _MainPageView createState() => _MainPageView();
}

class _MainPageView extends MainState {
  BuildContext ctx;

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
        return WillPopScope(
          onWillPop: () {
            if (Platform.isAndroid && !doubleClickBack()) {
              //ToastUtil.show('${MyLocalizations.of(context).clickAgain2Exit}');
            } else if (Platform.isAndroid) {
              //SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            }
            return Future.value(true);
          },
          child: Scaffold(
            body: PageView(
              controller: pageController,
              physics: NeverScrollableScrollPhysics(),
              children: List<Widget>.generate(modules.length, (index) {
                return ModuleConfig.buildPageTabView(context,modules[index]);
              }),
            ),
            bottomNavigationBar: CupertinoTabBar(
              backgroundColor: ColorTheme.instance().navBarColor,
              activeColor: ColorTheme.instance().navBarTextActiveColor,
              inactiveColor: ColorTheme.instance().navBarTextInactiveColor,
              currentIndex: currentTabIndex,
              onTap: (int index) => changeCurrentTab(index),
              items: List<BottomNavigationBarItem>.generate(modules.length, (index) {
                    return ModuleConfig.buildNavigationBarView(context,modules[index],currentTabIndex,index);
                  }),
            ),
          ),
        );
      },
      converter: (Store<AppState> store) {
        return store;
      },
    );
  }
}

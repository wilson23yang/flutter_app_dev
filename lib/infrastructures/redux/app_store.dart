import 'package:app_dev/infrastructures/redux/app_state.dart';
import 'package:redux/redux.dart';


class AppStore {
  static Store _store;

  ///设置全局Store
  static void setStore(Store store) {
    _store = store;
  }

  ///获取全局Store
  static Store<AppState> getStore() {
    return _store;
  }

  ///获取全局AppState
  static AppState getAppState() {
    return _store.state;
  }


  ///用户是否登录
  static bool hasLogin() {
    return _store?.state?.userInfo?.promoteCode != null;
  }


  ///获取全局是否正在加载状态
  static bool getLoadingState() {
    return _store.state.isLoading;
  }

  ///获取全局是否断网状态，true 断网
  static bool getNetworkState() {
    return _store.state.isNetworkBroken;
  }

  ///获取全局当天是否签到状态，true 已签到
  static bool getSignState() {
    return _store.state.isSignIn;
  }

  ///获取主题状态，true 黑色主题
  static bool getThemeState() {
    return _store?.state?.isDarkTheme;
  }

  ///获取主题状态，true 黑色主题
  static bool getRiseDropColorThemeState() {
    return _store.state.isRiseRedDropGreen;
  }
}

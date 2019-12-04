///Loading
class LoadingAction {
  final bool isLoading;

  LoadingAction(this.isLoading);
}

///theme state
class ThemeStateAction {
  final bool isDarkTheme;

  ThemeStateAction({this.isDarkTheme});
}

///行情涨跌颜色
class RiseDropColorThemeStateAction {
  final bool isRiseRedDropGreen;

  RiseDropColorThemeStateAction({this.isRiseRedDropGreen});
}

///net state
class NetStateAction {
  final bool isNetBroken;

  NetStateAction(this.isNetBroken);
}

///signIn state
class SignInAction {
  final bool isSignin;

  SignInAction(this.isSignin);
}

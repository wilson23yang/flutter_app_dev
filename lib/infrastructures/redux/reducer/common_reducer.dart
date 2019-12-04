import 'package:app_dev/infrastructures/redux/action/common_action.dart';
import 'package:redux/redux.dart';

///loadingReducer
final Reducer<bool> loadingReducer = combineReducers<bool>([
  TypedReducer<bool, LoadingAction>(_toggleLoading),
]);

bool _toggleLoading(bool state, LoadingAction action) {
  return action.isLoading;
}

///themeState Reducer
final Reducer<bool> themeStateReducer = combineReducers<bool>([
  TypedReducer<bool, ThemeStateAction>(_handleThemeState),
]);

bool _handleThemeState(bool state, ThemeStateAction action) {
  return action.isDarkTheme;
}

///themeState Reducer
final Reducer<bool> riseDropColorThemeStateReducer = combineReducers<bool>([
  TypedReducer<bool, RiseDropColorThemeStateAction>(_handleRiseDropColorThemeState),
]);

bool _handleRiseDropColorThemeState(bool state, RiseDropColorThemeStateAction action) {
  return action.isRiseRedDropGreen;
}

///netState Reducer
final Reducer<bool> netStateReducer = combineReducers<bool>([
  TypedReducer<bool, NetStateAction>(_handleNetState),
]);

bool _handleNetState(bool state, NetStateAction action) {
  return action.isNetBroken;
}

///signIn Reducer
final Reducer<bool> signInReducer = combineReducers<bool>([
  TypedReducer<bool, SignInAction>(_handleSignInState),
]);

bool _handleSignInState(bool state, SignInAction action) {
  return action.isSignin;
}

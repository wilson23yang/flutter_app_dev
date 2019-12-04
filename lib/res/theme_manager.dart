import 'package:app_dev/infrastructures/redux/action/common_action.dart';
import 'package:app_dev/infrastructures/redux/app_store.dart';
import 'package:app_dev/res/colors/color_theme.dart';
import 'package:app_dev/res/images/image_theme.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';


///
enum ThemeType{
  dark,light
}



///
///
///
class ThemeManager{

  ThemeManager();

  static ThemeManager _instance;

  static ThemeManager instance() => _getInstance();

  static ThemeManager _getInstance() {
    if (_instance == null) {
      _instance = ThemeManager();
    }
    return _instance;
  }

  //////////////////////////////////////////////////////////////////////////////

  static ThemeType _currentTheme = ThemeType.dark;

  ///
  void init(){
    _currentTheme = AppStore.getThemeState()
        ? ThemeType.dark
        : ThemeType.light;
    ColorTheme.instance().init(themeType: _currentTheme);
    ImageTheme.instance().init(themeType: _currentTheme);

  }


  ///
  void changeTheme({@required Store store,@required ThemeType themeType}){
    if(_currentTheme == themeType){
      return;
    }
    _currentTheme = themeType;
    _currentTheme == ThemeType.light
        ? store.dispatch(ThemeStateAction(isDarkTheme:false))
        : store.dispatch(ThemeStateAction(isDarkTheme:true));
    ColorTheme.instance().changeTheme(themeType: _currentTheme);
    ImageTheme.instance().changeTheme(themeType: _currentTheme);
  }

}

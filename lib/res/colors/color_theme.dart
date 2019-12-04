import 'package:app_dev/res/colors/auto_create/color_dark.dart';
import 'package:app_dev/res/colors/auto_create/color_light.dart';
import 'package:app_dev/res/theme_manager.dart';
import 'package:flutter/material.dart';

///
/// 页面颜色主题
///
///
class ColorTheme{

  ColorTheme();

  static ColorTheme _instance;

  static ColorTheme instance() => _getInstance();

  static ColorTheme _getInstance() {
    if (_instance == null) {
      _instance = ColorTheme();
    }
    return _instance;
  }

  //////////////////////////////////////////////////////////////////////////////
  Brightness brightness = Brightness.light;
  static ThemeType _currentColorTheme = ThemeType.dark;
  static Map<String,Color> _currentColorMap = <String,Color>{};

  ///
  void init({@required ThemeType themeType}){
    _currentColorTheme = themeType;
    if(_currentColorTheme == ThemeType.light){
      brightness = Brightness.light;
    } else {
      brightness = Brightness.dark;
    }
    _loadColors();
  }

  ///
  void _loadColors(){
    _currentColorMap.clear();
    if(_currentColorTheme == ThemeType.dark){
      _currentColorMap.addAll(ColorDark.colorSet);
    } else {
      _currentColorMap.addAll(ColorLight.colorSet);
    }
  }

  ///
  void changeTheme({@required ThemeType themeType}){
    if(_currentColorTheme == themeType){
      return;
    }
    _currentColorTheme = themeType;
    if(_currentColorTheme == ThemeType.light){
      brightness = Brightness.light;
    } else {
      brightness = Brightness.dark;
    }
    _loadColors();
  }

  ///
  Color _getCurrentColor({String key,Color light,Color dark,String desc}){
    return _currentColorMap[key];
  }

  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  ///
  /// 注：编辑后运行auto_create/script.dart，生成color_dark.dart,color_light.dart
  ///
  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  ///文本颜色
  Color get textTitleColor => _getCurrentColor(key:'textTitleColor',light: Color(0xFF22262F),dark: Colors.white);//--


  ///NavBar 颜色
  Color get navBarColor => _getCurrentColor(key:'navBarColor',light: Color(0xFFD7E2EC),dark: Color(0xFFD7E2EC));//-
  Color get navBarTextActiveColor => _getCurrentColor(key:'navBarTextActiveColor',light: Color(0xFF288DDD),dark: Color(0xFF288DDD));//-
  Color get navBarTextInactiveColor => _getCurrentColor(key:'navBarTextInactiveColor',light: Color(0xFF6288B4),dark: Color(0xFF6288B4));//-

}


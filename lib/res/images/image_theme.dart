import 'package:app_dev/res/images/auto_create/image_dark.dart';
import 'package:app_dev/res/images/auto_create/image_light.dart';
import 'package:app_dev/res/theme_manager.dart';
import 'package:meta/meta.dart';


///
/// 页面颜色主题
///
///
class ImageTheme{

  ImageTheme();

  static ImageTheme _instance;

  static ImageTheme instance() => _getInstance();

  static ImageTheme _getInstance() {
    if (_instance == null) {
      _instance = ImageTheme();
    }
    return _instance;
  }

  //////////////////////////////////////////////////////////////////////////////

  static ThemeType _currentTheme = ThemeType.dark;
  static Map<String,String> _currentImageMap = <String,String>{};

  ///
  void init({@required ThemeType themeType}){
    _currentTheme = themeType;
    _loadImages();
  }

  ///
  void _loadImages(){
    _currentImageMap.clear();
    if(_currentTheme == ThemeType.dark){
      _currentImageMap.addAll(ImageDark.map);
    } else {
      _currentImageMap.addAll(ImageLight.map);
    }
  }

  ///
  void changeTheme({@required ThemeType themeType}){
    if(_currentTheme == themeType){
      return;
    }
    _currentTheme = themeType;
    _loadImages();
  }

  ///
  String _getCurrentImage({String key,String light,String dark,String desc}){
    return _currentImageMap[key];
  }

  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  ///
  /// 注：编辑后运行auto_create/script.dart，生成image_dark.dart,image_light.dart
  ///
  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  String get nav_home_n => _getCurrentImage(key:'nav_home_n',light: 'images/nav_home_n.png',dark: 'images/nav_home_n.png');
  String get nav_home_p => _getCurrentImage(key:'nav_home_p',light: 'images/nav_home_p.png',dark: 'images/nav_home_p.png');
  String get nav_my_n => _getCurrentImage(key:'nav_my_n',light: 'images/nav_my_n.png',dark: 'images/nav_my_n.png');
  String get nav_my_p => _getCurrentImage(key:'nav_my_p',light: 'images/nav_my_p.png',dark: 'images/nav_my_p.png');

}






















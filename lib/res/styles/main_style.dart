
class MainStyle {
  MainStyle();

  static MainStyle _instance;

  static MainStyle instance() => _getInstance();

  static MainStyle _getInstance() {
    if (_instance == null) {
      _instance = MainStyle();
    }
    return _instance;
  }

  static void initDimen() {
    _instance = null;
    _instance = MainStyle();
  }


}

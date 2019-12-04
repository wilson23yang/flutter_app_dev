

class TempleStyle {
  TempleStyle();

  static TempleStyle _instance;

  static TempleStyle instance() => _getInstance();

  static TempleStyle _getInstance() {
    if (_instance == null) {
      _instance = TempleStyle();
    }
    return _instance;
  }

  static void initDimen() {
    _instance = null;
    _instance = TempleStyle();
  }


}

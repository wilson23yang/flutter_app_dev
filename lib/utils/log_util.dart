///当前app的编译类型：release isDebug = false, debug/Profile/test isDebug = true
const bool isDebug = !const bool.fromEnvironment("dart.vm.product");

class LogUtil {
  static const String _TAG_DEF = "###LogUtil###";

  static String TAG = _TAG_DEF;

  static void init({String tag: _TAG_DEF}) {
    TAG = tag;
  }

  static void e(Object object, {String tag}) {
    _printLog(tag, '  e  ', object);
  }

  static void v(Object object, {String tag}) {
    if (isDebug) {
      _printLog(tag, '  v  ', object);
    }
  }

  static void _printLog(String tag, String stag, Object object) {
    print('${(tag == null || tag.isEmpty) ? TAG : tag}    $object');
  }
}

import 'package:app_dev/config/global_constans_config.dart';
import 'package:app_dev/infrastructures/api/grpc/grpc_manager.dart';
import 'package:app_dev/infrastructures/redux/app_state.dart';
import 'package:app_dev/infrastructures/redux/app_store.dart';
import 'package:app_dev/infrastructures/redux/initialize.dart';
import 'package:app_dev/res/localizations/mylocalizations_delegate.dart';
import 'package:app_dev/res/theme_manager.dart';
import 'package:app_dev/utils/app_routes_util.dart';
import 'package:app_dev/view/main/page_main.dart';
import 'package:connectivity/connectivity.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';



bool globalNetWorkConnected = true;

void main() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final _store = await loadStore();
  runApp(MyApp(store: _store));
}

class MyApp extends StatefulWidget {
  final Store<AppState> store;
  final Router router = Router();

  MyApp({this.store}) {
    handlers.forEach((String path, Handler handler) {
      router.define(path, handler: handler);
    });
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();

    initNetworkStatus();

    AppStore.setStore(widget.store);
    _initTheme();
  }

  ///
  void initNetworkStatus() async {
    globalNetWorkConnected = await (Connectivity().checkConnectivity()) != ConnectivityResult.none;
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      globalNetWorkConnected = result != ConnectivityResult.none;
      if(globalNetWorkConnected){
        GRPCManager.instance.initClientChanel();
      }
    });
  }

  void _initTheme(){
    ThemeManager.instance().init();
  }


  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: MaterialApp(
        title: APP_NAMES,
        localizationsDelegates: [
          const MyLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('zh', 'CN'),
        ],
        theme: ThemeData(primarySwatch: Colors.blue),
        home: StoreConnector<AppState, AppState>(
          builder: (BuildContext context, AppState state) {
            return MainPage(context);
          },
          converter: (Store<AppState> store) {
            return store.state;
          },
        ),
        onGenerateRoute: (RouteSettings routeSettings) {
          return this.customRouter(widget.router, routeSettings);
        },
      ),
    );
  }

  // 自定义iOS风格的导航，也可以使用TrasitionType.custom自定义（还需要研究下)
  Route customRouter(Router router, RouteSettings routeSettings) {
    AppRouteMatch match = router.match(routeSettings.name);

    if (match != null) {
      return new CupertinoPageRoute<dynamic>(
          settings: routeSettings,
          fullscreenDialog: match.route.transitionType == TransitionType.nativeModal,
          builder: (BuildContext context) {
            return match.route.handler.handlerFunc(context, match.parameters);
          });
    } else {
      RouteMatch match = router.matchRoute(null, routeSettings.name,
          routeSettings: routeSettings, transitionType: TransitionType.native);
      return match.route;
    }
  }

}

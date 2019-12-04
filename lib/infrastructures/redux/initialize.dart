import 'dart:async';
import 'package:app_dev/infrastructures/redux/app_state.dart';
import 'package:app_dev/infrastructures/redux/reducer/app_reducer.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

///异步middleware
final epic = combineEpics([
  //doLoginEpic,
]);

/// 创建一个持久化器
final persistor = Persistor<AppState>(
    storage: FlutterStorage(),
    serializer: JsonSerializer<AppState>(AppState.fromJson),
    debug: false);

/// 从 persistor 中加载上一次存储的状态
Future<Store<AppState>> loadStore() async {
  final initialState = await persistor.load();

  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: initialState ??
        AppState(
          isLoading: false,
        ),
    middleware: [
      //  LoggingMiddleware.printer(),
      //EpicMiddleware(epic),
      persistor.createMiddleware(),
    ],
  );
  return store;
}

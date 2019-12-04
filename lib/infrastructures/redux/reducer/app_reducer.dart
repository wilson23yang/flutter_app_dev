
import 'package:app_dev/infrastructures/redux/app_state.dart';

///App主Reducer
///源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
///我们自定义了 appReducer 用于创建 store
AppState appReducer(AppState state, action) {
  return AppState(
    ///通过 LoginReducer 将 AppState 内的 userInfo 和 action 关联在一起
  );
}

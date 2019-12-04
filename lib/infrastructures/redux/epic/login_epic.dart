import 'dart:async';

import 'package:app_dev/infrastructures/redux/action/login_action.dart';
import 'package:app_dev/infrastructures/redux/app_state.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

///异步登录
Stream<dynamic> doLoginEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
  return Observable(actions).ofType(TypeToken<StartLoginAction>()).flatMap((action) {
    return Observable(() async* {

    }());
  });
}


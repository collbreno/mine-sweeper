import 'dart:async';

import 'package:business/business.dart';
import 'package:business/src/home/models/home_state.dart';

abstract class HomeAction extends BaseAction {
  FutureOr<HomeState> reduceHomeState();

  @override
  FutureOr<AppState> reduce() {
    var homeState = reduceHomeState();
    if (homeState is Future) {
      return (homeState as Future)
          .then((_homeState) => state.copy(homeState: _homeState));
    }

    return (homeState == null) ? null : state.copy(homeState: homeState);
  }



}
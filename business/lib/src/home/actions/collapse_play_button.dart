import 'dart:async';

import 'package:business/src/home/actions/home_action.dart';
import 'package:business/src/home/models/home_state.dart';

class CollapsePlayButtonAction extends HomeAction {
  @override
  HomeState reduceHomeState() {
    print('collapse play button');
    return homeState.copy(
      isPlayButtonCollapsed: true,
    );
  }

}
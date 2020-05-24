import 'dart:async';

import 'package:business/src/home/actions/home_action.dart';
import 'package:business/src/home/models/home_state.dart';

class ExpandPlayButtonAction extends HomeAction {
  @override
  HomeState reduceHomeState() {
    return homeState.copy(
      isPlayButtonCollapsed: false
    );
  }

}
import 'dart:async';

import 'package:business/src/home/actions/home_action.dart';
import 'package:business/src/home/models/home_state.dart';

class ShowPromptDialogAction extends HomeAction {
  @override
  HomeState reduceHomeState() {
    return homeState.copy(
      isPromptDialogVisible: true,
    );
  }

}

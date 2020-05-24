import 'dart:async';

import 'package:business/src/home/actions/home_action.dart';
import 'package:business/src/home/models/home_state.dart';

class DismissPromptDialogAction extends HomeAction {
  @override
  HomeState reduceHomeState() {
    print('dismiss dialog');
    return homeState.copy(
      isPromptDialogVisible: false,
    );
  }

}
import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class HomeConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<GameState, ViewModel>(
      model: ViewModel(),
      builder: (BuildContext context, ViewModel vm) {
        return Home(
          initGameBoard: vm.initBoard,
        );
      },
    );
  }
}

class ViewModel extends BaseModel<GameState> {
  ViewModel();

  void Function(Difficulty) initBoard;

  ViewModel.build({
    @required this.initBoard
  });

  @override
  ViewModel fromStore() {
    return ViewModel.build(
      initBoard: (Difficulty d) => dispatch(CreateEmptyBoardAction(d))
    );
  }
}
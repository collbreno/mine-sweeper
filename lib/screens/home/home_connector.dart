import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:mine_sweeper/business/game/actions/game_actions.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';
import 'package:mine_sweeper/screens/home/home.dart';

class HomeConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<GameState, ViewModel>(
      model: ViewModel(),
      builder: (BuildContext context, ViewModel vm) {
        return Home(
          count: vm.count,
          onFabPress: vm.onFabPress,
          text: vm.text,
        );
      },
    );
  }
}

class ViewModel extends BaseModel<GameState> {
  ViewModel();

  int count;
  String text;
  void Function() onFabPress;

  ViewModel.build({
    @required this.count,
    @required this.text,
    @required this.onFabPress
  }) : super(equals: [count, text]);

  @override
  ViewModel fromStore() {
    return ViewModel.build(
      count: state.count,
      text: state.title,
      onFabPress: () => dispatch(IncrementAction())
    );
  }
}
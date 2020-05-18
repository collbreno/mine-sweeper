import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';
import 'package:flutter/material.dart';

import 'game.dart';


class GameConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<GameState, ViewModel>(
      model: ViewModel(),
      builder: (BuildContext context, ViewModel vm) {
        return Game(
          secondsElapsed: vm.secondsElapsed,
          horizontalTiles: vm.horizontalTiles,
          verticalTiles: vm.verticalTiles,
          numberOfBombs: vm.numberOfBombs,
          tiles: vm.tiles,
          makeAMove: vm.makeAMove,
          toggleFlag: vm.toggleFlag,
          showDialogEvt: vm.showDialogEvt,
          gameProgress: vm.gameProgress,
          newGame: vm.newGame,
        );
      },
    );
  }
}

class ViewModel extends BaseModel<GameState> {
  ViewModel();

  int verticalTiles;
  int horizontalTiles;
  int numberOfBombs;
  List<Tile> tiles;
  void Function(int) makeAMove;
  void Function(int) toggleFlag;
  void Function() newGame;
  Event<DialogType> showDialogEvt;
  GameProgress gameProgress;
  int secondsElapsed;

  ViewModel.build({
    @required this.verticalTiles,
    @required this.horizontalTiles,
    @required this.numberOfBombs,
    @required this.tiles,
    @required this.makeAMove,
    @required this.toggleFlag,
    @required this.showDialogEvt,
    @required this.gameProgress,
    @required this.newGame,
    @required this.secondsElapsed
  }) : super(equals: [
      verticalTiles, 
      horizontalTiles, 
      numberOfBombs, 
      secondsElapsed,
      tiles.map((tile) => tile.state),
      tiles.map((tile) => tile.content),
      showDialogEvt,
      gameProgress
    ]);

  @override
  ViewModel fromStore() {
    return ViewModel.build(
      secondsElapsed: state.timeElapsed.inSeconds,
      horizontalTiles: state.horizontalTiles,
      numberOfBombs: state.numberOfBombs,
      tiles: state.tiles,
      showDialogEvt: state.showDialogEvt,
      gameProgress: state.gameProgress,
      verticalTiles: state.verticalTiles,
      newGame: () => dispatch(CreateEmptyBoardAction(Difficulty.normal)),
      toggleFlag: (index) => dispatch(ToggleFlagAction(index)),
      makeAMove: (index) => dispatch(MakeAMoveAction(index))
    );
  }
}
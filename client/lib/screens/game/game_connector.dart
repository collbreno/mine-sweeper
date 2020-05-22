import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';
import 'package:flutter/material.dart';

import 'game.dart';


class GameConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
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
          shareCode: vm.shareCode,
          shareGame: vm.shareGame,
          isSyncing: vm.isSyncing,
        );
      },
    );
  }
}

class ViewModel extends BaseModel<AppState> {
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
  AsyncData<String> shareCode;
  void Function() shareGame;
  bool isSyncing;

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
    @required this.secondsElapsed,
    @required this.shareCode,
    @required this.shareGame,
    @required this.isSyncing,
  }) : super(equals: [
      verticalTiles, 
      horizontalTiles, 
      numberOfBombs, 
      secondsElapsed,
      tiles.map((tile) => tile.state),
      tiles.map((tile) => tile.content),
      showDialogEvt,
      gameProgress,
      shareCode,
      isSyncing,
    ]);

  @override
  ViewModel fromStore() {
    return ViewModel.build(
      secondsElapsed: state.boardState.timeElapsed.inSeconds,
      horizontalTiles: state.boardState.horizontalTiles,
      numberOfBombs: state.boardState.numberOfBombs,
      tiles: state.boardState.tiles,
      showDialogEvt: state.boardState.showDialogEvt,
      gameProgress: state.boardState.gameProgress,
      shareCode: state.cloudState.shareCode,
      verticalTiles: state.boardState.verticalTiles,
      isSyncing: state.cloudState.syncStatus.isSyncing,
      newGame: () => dispatch(CreateEmptyBoardAction(Difficulty.normal)),
      toggleFlag: (index) => dispatch(ToggleFlagAction(index)),
      makeAMove: (index) => dispatch(MakeAMoveAction(index)),
      shareGame: () => dispatch(ShareGameAction())
    );
  }
}
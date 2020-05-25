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
          boardSize: vm.boardSize,
          numberOfBombs: vm.numberOfBombs,
          tiles: vm.tiles,
          showDialogEvt: vm.showDialogEvt,
          gameProgress: vm.gameProgress,
          newGame: vm.newGame,
          shareCode: vm.shareCode,
          isSyncing: vm.isSyncing,
          isWatching: vm.isRemote,
          shareGame: vm.isRemote ? null : vm.shareGame,
          toggleFlag: vm.isRemote ? null : vm.toggleFlag,
          makeAMove: vm.isRemote ? null : vm.makeAMove,
          onDispose: vm.cleanBoard,
        );
      },
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();

  BoardSize boardSize;
  int numberOfBombs;
  List<Tile> tiles;
  void Function(int) makeAMove;
  void Function(int) toggleFlag;
  void Function() newGame;
  void Function() cleanBoard;
  Event<DialogType> showDialogEvt;
  GameProgress gameProgress;
  int secondsElapsed;
  AsyncData<String> shareCode;
  void Function() shareGame;
  bool isSyncing;
  bool isRemote;

  ViewModel.build({
    @required this.boardSize,
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
    @required this.isRemote,
    @required this.cleanBoard,
  }) : super(equals: [
      boardSize,
      numberOfBombs, 
      secondsElapsed,
      tiles.map((tile) => tile.state),
      tiles.map((tile) => tile.content),
      showDialogEvt,
      gameProgress,
      shareCode,
      isSyncing,
      isRemote,
    ]);

  @override
  ViewModel fromStore() {
    return ViewModel.build(
      secondsElapsed: state.boardState.timeElapsed.inSeconds,
      boardSize: state.boardState.boardSize,
      numberOfBombs: state.boardState.numberOfBombs,
      tiles: state.boardState.tiles,
      showDialogEvt: state.boardState.showDialogEvt,
      gameProgress: state.boardState.gameProgress,
      shareCode: state.cloudState.shareCode,
      isRemote: state.cloudState.isRemote,
      isSyncing: state.cloudState.syncStatus.isSyncing,
      newGame: () => dispatch(CreateEmptyBoardAction(Difficulty.normal)),
      toggleFlag: (index) => dispatch(ToggleFlagAction(index)),
      makeAMove: (index) => dispatch(MakeAMoveAction(index)),
      shareGame: () => dispatch(ShareGameAction()),
      cleanBoard: () => dispatch(CleanBoardAction()),
    );
  }
}
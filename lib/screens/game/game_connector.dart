import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:mine_sweeper/business/game/actions/create_empty_board.dart';
import 'package:mine_sweeper/business/game/actions/make_a_move.dart';
import 'package:mine_sweeper/business/game/actions/toggle_flag.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';
import 'package:mine_sweeper/business/game/models/tile.dart';
import 'package:mine_sweeper/screens/game/game.dart';


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
          showVictoryDialogEvt: vm.showVictoryDialogEvt,
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
  Event showVictoryDialogEvt;
  int secondsElapsed;

  ViewModel.build({
    @required this.verticalTiles,
    @required this.horizontalTiles,
    @required this.numberOfBombs,
    @required this.tiles,
    @required this.makeAMove,
    @required this.toggleFlag,
    @required this.showVictoryDialogEvt,
    @required this.newGame,
    @required this.secondsElapsed
  }) : super(equals: [
      verticalTiles, 
      horizontalTiles, 
      numberOfBombs, 
      secondsElapsed,
      tiles.map((tile) => tile.state),
      tiles.map((tile) => tile.content),
      showVictoryDialogEvt
    ]);

  @override
  ViewModel fromStore() {
    return ViewModel.build(
      secondsElapsed: state.timeElapsed.inSeconds,
      horizontalTiles: state.horizontalTiles,
      numberOfBombs: state.numberOfBombs,
      tiles: state.tiles,
      showVictoryDialogEvt: state.showVictoryDialogEvt,
      verticalTiles: state.verticalTiles,
      newGame: () => dispatch(CreateEmptyBoardAction(
        horizontalTiles: 5, 
        verticalTiles: 7, 
        numberOfBombs: 15
      )),
      toggleFlag: (index) => dispatch(ToggleFlagAction(index)),
      makeAMove: (index) => dispatch(MakeAMoveAction(index))
    );
  }
}
import 'package:async_redux/async_redux.dart';
import 'package:mine_sweeper/business/game/models/game_progress.dart';
import 'package:mine_sweeper/business/game/models/tile.dart';
import 'package:mine_sweeper/business/game/services/stopwatch_service.dart';
import '../models/game_state.dart';


// Essa ação é disparada quando o usuário clica em Novo Jogo
class CreateEmptyBoardAction extends ReduxAction<GameState> {
  CreateEmptyBoardAction(Difficulty this.difficulty);
  // CreateEmptyBoardAction({this.numberOfBombs, this.horizontalTiles, this.verticalTiles});
  final Difficulty difficulty;

  GameState reduce() {
    var tiles = _createEmptyTiles();
    StopwatchService().stopAndReset();
    return state.copy(
      horizontalTiles: getHorizontalTiles(),
      numberOfBombs: getNumberOfBombs(),
      verticalTiles: getVerticalTiles(), 
      tilesToDiscover: getVerticalTiles() * getHorizontalTiles() - getNumberOfBombs(),
      tiles: tiles,
      gameProgress: GameProgress.created
    );
  }

  List<Tile> _createEmptyTiles(){
    return List<Tile>.generate(getVerticalTiles()*getHorizontalTiles(), (index) => Tile(content: TileContent.empty, state: TileState.none));
  }

  int getNumberOfBombs() {
    var list = [9, 27, 36];
    return list.elementAt(difficulty.index);
  }

  int getVerticalTiles() {
    var list = [7, 15, 22];
    return list.elementAt(difficulty.index);
  }

  int getHorizontalTiles() {
    var list = [5, 10, 15];
    return list.elementAt(difficulty.index);
  }

}
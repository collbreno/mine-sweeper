import 'package:async_redux/async_redux.dart';
import 'package:mine_sweeper/business/game/models/game_progress.dart';
import 'package:mine_sweeper/business/game/models/tile.dart';
import 'package:mine_sweeper/business/game/services/stopwatch_service.dart';
import '../models/game_state.dart';


// Essa ação é disparada quando o usuário clica em Novo Jogo
class CreateEmptyBoardAction extends ReduxAction<GameState> {
  // CreateEmptyBoardAction({this.numberOfBombs, this.horizontalTiles, this.verticalTiles});
  final int numberOfBombs = 27;
  final int verticalTiles = 15;
  final int horizontalTiles = 10;

  GameState reduce() {
    var tiles = _createEmptyTiles();
    StopwatchService().stopAndReset();
    return state.copy(
      horizontalTiles: horizontalTiles,
      numberOfBombs: numberOfBombs,
      verticalTiles: verticalTiles, 
      tilesToDiscover: verticalTiles * horizontalTiles - numberOfBombs,
      tiles: tiles,
      gameProgress: GameProgress.created
    );
  }

  List<Tile> _createEmptyTiles(){
    return List<Tile>.generate(verticalTiles*horizontalTiles, (index) => Tile(content: TileContent.empty, state: TileState.none));
  }

}
import 'package:async_redux/async_redux.dart';
import 'package:mine_sweeper/business/game/models/tile.dart';
import '../models/game_state.dart';


// Essa ação é disparada quando o usuário clica em Novo Jogo
class InitBoardAction extends ReduxAction<GameState> {
  InitBoardAction({this.numberOfBombs, this.horizontalTiles, this.verticalTiles});
  final int numberOfBombs;
  final int verticalTiles;
  final int horizontalTiles;

  GameState reduce() {
    var tiles = _createEmptyTiles();
    return state.copy(
      horizontalTiles: horizontalTiles,
      numberOfBombs: numberOfBombs,
      verticalTiles: verticalTiles, 
      tilesToDiscover: verticalTiles * horizontalTiles - numberOfBombs,
      tiles: tiles,
      initializated: false
    );
  }

  List<Tile> _createEmptyTiles(){
    return List<Tile>.generate(verticalTiles*horizontalTiles, (index) => Tile(content: TileContent.empty, state: TileState.none));
  }

}
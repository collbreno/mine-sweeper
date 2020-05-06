import 'package:async_redux/async_redux.dart';
import '../models/game_state.dart';

class InitBoardAction extends ReduxAction<GameState> {
  InitBoardAction({this.numberOfBombs, this.horizontalTiles, this.verticalTiles});
  final int numberOfBombs;
  final int verticalTiles;
  final int horizontalTiles;

  GameState reduce() {
    var tiles = _createEmptyTiles();
    return state.copy(
      horizontalTiles: this.horizontalTiles,
      numberOfBombs: this.numberOfBombs,
      verticalTiles: this.verticalTiles,
      tiles: tiles,
      initializated: false
    );
  }

  List<Tile> _createEmptyTiles(){
    return List<Tile>.generate(verticalTiles*horizontalTiles, (index) => Tile(content: TileContent.empty, state: TileState.none));
  }

}
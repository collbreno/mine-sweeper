import 'package:async_redux/async_redux.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';
import 'package:mine_sweeper/business/game/models/tile.dart';

class ExplodeBombsAction extends ReduxAction<GameState> {
  ExplodeBombsAction(this.firstBombIndex);

  final int firstBombIndex;

  GameState reduce() {
    var tiles = state.tiles;
    var newTiles = List<Tile>.generate(tiles.length, (index){
      var tile = tiles.elementAt(index);
      bool isBomb = tile.content == TileContent.bomb;
      return Tile(content: tile.content, state: isBomb?TileState.discovered:tile.state);
    });
    return state.copy(
      tiles: newTiles
    );
  }
}
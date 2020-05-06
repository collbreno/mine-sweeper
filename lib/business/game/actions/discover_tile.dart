import 'package:async_redux/async_redux.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';

class DiscoverTileAction extends ReduxAction<GameState> {
  DiscoverTileAction(this.index);

  final int index;

  @override
  GameState reduce() {
    var tiles = state.tiles;
    var tileContent = state.tiles.elementAt(index).content;
    var newTile = Tile(content: tileContent, state: TileState.discovered);
    tiles.replaceRange(index, index+1, [newTile]);
    return state.copy(
      tiles: tiles
    );
  }
}
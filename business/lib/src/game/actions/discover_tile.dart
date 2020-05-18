import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';

// Essa ação é disparada quando o usuário clica em uma casa sem bomba
class DiscoverTileAction extends ReduxAction<GameState> {
  DiscoverTileAction(this.index);

  final int index;

  @override
  GameState reduce() {
    var tiles = state.tiles;
    var tileClicked = state.tiles.elementAt(index);
    var newTile = Tile(content: tileClicked.content, state: TileState.discovered);
    tiles.replaceRange(index, index+1, [newTile]);
    return state.copy(
      tiles: tiles,
      tilesToDiscover: state.tilesToDiscover - 1
    );
  }
}
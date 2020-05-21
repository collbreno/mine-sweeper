import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';
import 'package:business/src/firebase/actions/convert_tiles_state_to_string.dart';

// Essa ação é disparada quando o usuário clica em uma casa sem bomba
class DiscoverTileAction extends BoardAction {
  DiscoverTileAction(this.index);

  final int index;

  @override
  BoardState reduceBoardState() {
    var tileClicked = tiles.elementAt(index);
    var newTile = Tile(content: tileClicked.content, state: TileState.discovered);
    tiles.replaceRange(index, index+1, [newTile]);
    dispatch(ConvertTilesStateToStringAction(tiles));
    return boardState.copy(
      tiles: tiles,
      tilesToDiscover: tilesToDiscover - 1
    );
  }
}
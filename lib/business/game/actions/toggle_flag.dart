import 'package:async_redux/async_redux.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';
import 'package:mine_sweeper/business/game/models/tile.dart';


// Essa ação é disparada quando o usuário clica e pressiona em alguma casa
class ToggleFlagAction extends ReduxAction<GameState> {
  ToggleFlagAction(this.index);

  final int index;

  @override
  GameState reduce() {
    var tiles = state.tiles;
    var tileClicked = state.tiles.elementAt(index);
    var newTile = Tile(content: tileClicked.content, state: tileClicked.state == TileState.flag ? TileState.none : TileState.flag);
    tiles.replaceRange(index, index+1, [newTile]);
    return state.copy(
      tiles: tiles
    );
  }
}
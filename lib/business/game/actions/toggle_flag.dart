import 'package:async_redux/async_redux.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';
import 'package:mine_sweeper/business/game/models/tile.dart';


// Essa ação é disparada quando o usuário clica e pressiona em alguma casa
class ToggleFlagAction extends ReduxAction<GameState> {
  ToggleFlagAction(this.index);

  final int index;

  @override
  GameState reduce() {
    if (!state.initializated) return null; // Só deixa marcar bandeiras quando o jogo já estiver inicializado
    var tiles = state.tiles;
    var tileClicked = state.tiles.elementAt(index);
    bool isAlreadyMarked = tileClicked.state == TileState.flag;
    var newTile = Tile(content: tileClicked.content, state: isAlreadyMarked ? TileState.none : TileState.flag);
    tiles.replaceRange(index, index+1, [newTile]);
    return state.copy(
      tiles: tiles,
      numberOfBombs: state.numberOfBombs + (isAlreadyMarked ? 1 : -1)
    );
  }
}
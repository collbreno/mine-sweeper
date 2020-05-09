import 'package:async_redux/async_redux.dart';
import 'package:mine_sweeper/business/game/actions/show_victory_dialog.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';
import 'package:mine_sweeper/business/game/models/tile.dart';

// Essa ação é disparada quando o usuário clica em uma bomba, acabando o jogo
class ExplodeBombsAction extends ReduxAction<GameState> {
  ExplodeBombsAction(this.firstBombIndex);

  final int firstBombIndex;

  GameState reduce() {
    var tiles = state.tiles;
    dispatch(ShowVictoryDialogAction());
    return null;
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
import 'package:async_redux/async_redux.dart';
import 'package:mine_sweeper/business/game/actions/discover_tile.dart';
import 'package:mine_sweeper/business/game/actions/discover_tiles_recursively.dart';
import 'package:mine_sweeper/business/game/actions/explode_bombs.dart';
import 'package:mine_sweeper/business/game/actions/initialize_board.dart';
import 'package:mine_sweeper/business/game/actions/make_a_move_on_neighbors.dart';
import 'package:mine_sweeper/business/game/models/game_progress.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';
import 'package:mine_sweeper/business/game/models/tile.dart';


// Essa ação é disparada quando o usuário clica em uma casa qualquer
class MakeAMoveAction extends ReduxAction<GameState> {
  MakeAMoveAction(this.index);

  final int index;

  @override
  GameState reduce() {
    if (state.gameProgress == GameProgress.created)   // Se o tabuleiro não estiver inicializado:
      dispatch(InitializeBoardAction(index));         // inicializa
    if (state.gameProgress != GameProgress.inProgress) return null;
    var tile = state.tiles.elementAt(index);
    if (tile.state == TileState.none) {
      if (tile.content == TileContent.bomb){
        dispatch(ExplodeBombsAction());
        dispatch(DiscoverTileAction(index));
      }
      else if (tile.content == TileContent.empty){
        dispatch(DiscoverTilesRecursivelyAction(index));
      }
      else {
        dispatch(DiscoverTileAction(index));
      }
    }
    else if (tile.state == TileState.discovered) {                                  // Se a casa clicada estiver descoberta
      if (tile.content != TileContent.empty && tile.content != TileContent.bomb){   // e for um número:
        dispatch(MakeAMoveOnNeighborsAction(index));                                // abre os vizinhos
      } 
    }
    return null;
  }

}
import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';


// Essa ação é disparada quando o usuário clica em uma casa qualquer
class MakeAMoveAction extends ReduxAction<GameState> {
  MakeAMoveAction(this.index);

  final int index;

  @override
  GameState reduce() {
    if (state.gameProgress == GameProgress.created) {
      dispatch(InitializeBoardAction(index));
    }         // inicializa
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
import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';


// Essa ação é disparada quando o usuário clica em uma casa sem bomba e sem bomba na vizinhança
class DiscoverTilesRecursivelyAction extends ReduxAction<GameState> {
  DiscoverTilesRecursivelyAction(this.index);
  final int index;

  @override
  GameState reduce() {
    dispatch(DiscoverTileAction(index));
    var neighborIndexes = NeighborhoodService(state).getNeighborsIndexes(index);
    for (int neighborIndex in neighborIndexes){
      var neighbor = state.tiles.elementAt(neighborIndex);
      if (neighbor.state == TileState.none){
        if (neighbor.content == TileContent.empty){
          dispatch(DiscoverTilesRecursivelyAction(neighborIndex));
        }
        else if (neighbor.content != TileContent.bomb){ //Conteúdo é algum número (entre 1 e 8)
          dispatch(DiscoverTileAction(neighborIndex));
        }
      }
    }
    return null;
  }


}
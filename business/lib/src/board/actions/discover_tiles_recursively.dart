import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';


// Essa ação é disparada quando o usuário clica em uma casa sem bomba e sem bomba na vizinhança
class DiscoverTilesRecursivelyAction extends BoardAction {
  DiscoverTilesRecursivelyAction(this.index) {
    _neighborhoodService = NeighborhoodService(boardSize);
  }

  final int index;
  NeighborhoodService _neighborhoodService;

  @override
  BoardState reduceBoardState() {
    dispatch(DiscoverTileAction(index));
    var neighborIndexes = _neighborhoodService.getNeighborsIndexes(index);
    for (int neighborIndex in neighborIndexes){
      var neighbor = tiles.elementAt(neighborIndex);
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
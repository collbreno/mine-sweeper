import 'package:async_redux/async_redux.dart';
import 'package:mine_sweeper/business/game/actions/discover_tile.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';
import 'package:mine_sweeper/business/game/models/tile.dart';
import 'package:mine_sweeper/business/game/services/neighborhood_service.dart';

// Essa ação é disparada quando o usuário clica em uma casa sem bomba e sem bomba na vizinhança
class DiscoverTilesRecursivelyAction extends ReduxAction<GameState> {
  DiscoverTilesRecursivelyAction(this.index);
  final int index;

  GameState reduce() {
    dispatch(DiscoverTileAction(index));
    List<int> neighborIndexes = NeighborhoodService().getNeighborsIndexes(index);
    for (int neighborIndex in neighborIndexes){
      Tile neighbor = state.tiles.elementAt(neighborIndex);
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
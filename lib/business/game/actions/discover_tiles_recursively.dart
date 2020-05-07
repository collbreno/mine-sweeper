import 'package:async_redux/async_redux.dart';
import 'package:mine_sweeper/business/game/actions/discover_tile.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';

class DiscoverTilesRecursivelyAction extends ReduxAction<GameState> {
  DiscoverTilesRecursivelyAction(this.index);
  final int index;

  GameState reduce() {
    dispatch(DiscoverTileAction(index));
    List<int> neighborIndexes = _getValidNeighborsIndexes();
    for (int i = 0; i < neighborIndexes.length; i++){
      int neighborIndex = neighborIndexes.elementAt(i);
      Tile neighbor= state.tiles.elementAt(neighborIndex);
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



  List<int> _getValidNeighborsIndexes() {
    return _getNeighborsIndexes().where((neighborIndex) => _validateNeighborIndex(neighborIndex)).toList();
  }

  List<int> _getNeighborsIndexes(){
    return [
      index - state.horizontalTiles - 1,
      index - state.horizontalTiles,
      index - state.horizontalTiles + 1,
      index -1 ,
      index + 1,
      index + state.horizontalTiles - 1,
      index + state.horizontalTiles,
      index + state.horizontalTiles + 1
    ];
  }

  bool _validateNeighborIndex(int neighborIndex) {
    return neighborIndex >= 0 && neighborIndex < (state.horizontalTiles*state.verticalTiles);
  }



}
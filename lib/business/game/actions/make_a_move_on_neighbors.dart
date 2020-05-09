import 'package:async_redux/async_redux.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';
import 'package:mine_sweeper/business/game/models/tile.dart';
import 'package:mine_sweeper/business/game/actions/make_a_move.dart';
import 'package:mine_sweeper/business/game/services/neighborhood_service.dart';

// Essa ação é disparada quando o usuário clica em uma casa ocupada por um número

class MakeAMoveOnNeighborsAction extends ReduxAction<GameState> {
  MakeAMoveOnNeighborsAction(this.index);

  final int index;

  @override
  GameState reduce() {
    if (_areAllFlagsMarked()) {
      var neighborsIndexes = NeighborhoodService().getNeighborsIndexes(index);
      for (int neighborIndex in neighborsIndexes){
        if (state.tiles.elementAt(neighborIndex).state == TileState.none){ // Dispara a ação somente nos vizinhos que ainda não foram descobertos
          dispatch(MakeAMoveAction(neighborIndex));
        }
      }
    }
    return null;
  }

  bool _areAllFlagsMarked(){
    int ammountOfBombsInNeighborhood = state.tiles.elementAt(index).content.index;
    int count = 0;
    var neighborsIndexes = NeighborhoodService().getNeighborsIndexes(index);
    for (int neighborIndex in neighborsIndexes) {
      if (state.tiles.elementAt(neighborIndex).state == TileState.flag) count++;
    }
    return count == ammountOfBombsInNeighborhood;
  }
}
import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';

// Essa ação é disparada quando o usuário clica em uma casa ocupada por um número

class MakeAMoveOnNeighborsAction extends BoardAction {
  MakeAMoveOnNeighborsAction(this.index);

  final int index;

  @override
  BoardState reduceBoardState() {
    if (_areAllFlagsMarked()) {
      var neighborsIndexes = NeighborhoodService(boardState).getNeighborsIndexes(index);
      for (var neighborIndex in neighborsIndexes){
        if (tiles.elementAt(neighborIndex).state == TileState.none){ // Dispara a ação somente nos vizinhos que ainda não foram descobertos
          dispatch(MakeAMoveAction(neighborIndex));
        }
      }
    }
    return null;
  }

  bool _areAllFlagsMarked(){
    var amountOfBombsInNeighborhood = tiles.elementAt(index).content.index;
    var count = 0;
    var neighborsIndexes = NeighborhoodService(boardState).getNeighborsIndexes(index);
    for (int neighborIndex in neighborsIndexes) {
      if (tiles.elementAt(neighborIndex).state == TileState.flag) count++;
    }
    return count == amountOfBombsInNeighborhood;
  }
}
import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';


// Essa ação é disparada quando o usuário clica na sua primeira casa
class PlaceNumbersAction extends ReduxAction<GameState> {

   GameState reduce() {
    List<Tile> tiles = _putNumbersOnTiles();
    return state.copy(
      tiles: tiles,
    );
  }

  List<Tile> _putNumbersOnTiles(){
    var newTiles = List<Tile>.generate(state.tiles.length, (index){
      var currentTile = state.tiles.elementAt(index);
      if (currentTile.content == TileContent.bomb) return currentTile;
      else {
        int ammountOfBombsInNeighborhood = _getAmmountOfBombsInNeighborhood(index);
        TileContent content = _getTileContent(ammountOfBombsInNeighborhood);
        return Tile(content: content, state: TileState.none);
      }
    });
    return newTiles;
  }

  TileContent _getTileContent(int ammount) {
    return TileContent.values.elementAt(ammount);
  }

  int _getAmmountOfBombsInNeighborhood(int index){
    int result = 0;
    var validNeighborsIndexes = NeighborhoodService(state).getNeighborsIndexes(index);
    for (int i = 0; i < validNeighborsIndexes.length; i++){
      if (state.tiles.elementAt(validNeighborsIndexes.elementAt(i)).content == TileContent.bomb) result++;
    }
    return result;
  }


}
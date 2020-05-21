import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';
import 'package:business/src/firebase/actions/convert_tiles_content_to_string.dart';

// Essa ação é disparada quando o usuário clica na sua primeira casa
class PlaceNumbersAction extends BoardAction {
  @override
  BoardState reduceBoardState() {
    var newTiles = _putNumbersOnTiles();
    dispatch(ConvertTilesContentToString(newTiles));
    return boardState.copy(
      tiles: newTiles,
    );
  }

  List<Tile> _putNumbersOnTiles() {
    var newTiles = List<Tile>.generate(tiles.length, (index) {
      var currentTile = tiles.elementAt(index);
      if (currentTile.content == TileContent.bomb) {
        return currentTile;
      } else {
        var amountOfBombsInNeighborhood =
            _getAmountOfBombsInNeighborhood(index);
        var content = _getTileContent(amountOfBombsInNeighborhood);
        return Tile(content: content, state: TileState.none);
      }
    });
    return newTiles;
  }

  TileContent _getTileContent(int amount) {
    return TileContent.values.elementAt(amount);
  }

  int _getAmountOfBombsInNeighborhood(int index) {
    var result = 0;
    var validNeighborsIndexes =
        NeighborhoodService(boardState).getNeighborsIndexes(index);
    for (var i = 0; i < validNeighborsIndexes.length; i++) {
      if (tiles.elementAt(validNeighborsIndexes.elementAt(i)).content ==
          TileContent.bomb) result++;
    }
    return result;
  }
}
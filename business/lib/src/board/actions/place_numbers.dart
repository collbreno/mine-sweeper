import 'package:business/business.dart';

class PlaceNumbersAction extends BoardAction {
  NeighborhoodService _neighborhoodService;
  PlaceNumbersAction() {
    _neighborhoodService = NeighborhoodService(boardSize);
  }

  @override
  BoardState reduceBoardState() {
    var newTiles = _putNumbersOnTiles();
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
        _neighborhoodService.getNeighborsIndexes(index);
    for (var neighborIndex in validNeighborsIndexes) {
      if (tiles.elementAt(neighborIndex).content ==
          TileContent.bomb) result++;
    }
    return result;
  }
}

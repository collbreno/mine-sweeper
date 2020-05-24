import '../../../business.dart';

class ConverterHelper {

  static String convertTilesStateToString(List<Tile> tiles) {
    return tiles.fold('', (acc, current) => acc += current.state.index.toString());
  }

  static String convertTilesContentToString(List<Tile> tiles) {
    return tiles.fold('', (acc, current) => acc += current.content.index.toString());
  }


  static List<Tile> updateTilesStateWithString(List<Tile> tiles, String tilesState) {
    var updatedTiles = List<Tile>.generate(tiles.length, (index){
      var tileContent = tiles.elementAt(index).content;
      var tileStateEnumIndex = int.tryParse(tilesState[index]);
      var tileState = TileState.values.elementAt(tileStateEnumIndex);
      return Tile(content: tileContent, state: tileState);
    });
    return updatedTiles;
  }

  static List<Tile> createTilesFromString(String tilesState, String tilesContent) {
    var updatedTiles = List<Tile>.generate(tilesContent.length, (index){
      var tileStateEnumIndex = int.tryParse(tilesState[index]);
      var tileState = TileState.values.elementAt(tileStateEnumIndex);
      var tileContentEnumIndex = int.tryParse(tilesContent[index]);
      var tileContent = TileContent.values.elementAt(tileContentEnumIndex);
      return Tile(content: tileContent, state: tileState);
    });
    return updatedTiles;
  }

  static List<Tile> updateTilesContentWithString(List<Tile> tiles, String tilesContent) {
    var updatedTiles = List<Tile>.generate(tiles.length, (index){
      var tileState = tiles.elementAt(index).state;
      var tileContentEnumIndex = int.tryParse(tilesContent[index]);
      var tileContent = TileContent.values.elementAt(tileContentEnumIndex);
      return Tile(content: tileContent, state: tileState);
    });
    return updatedTiles;
  }
}
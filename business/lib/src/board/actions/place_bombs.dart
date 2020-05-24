import 'dart:math';
import 'package:business/business.dart';


// Essa ação é disparada quando o usuário clica na sua primeira casa
class PlaceBombsAction extends BoardAction {
  final int indexClicked;
  NeighborhoodService _neighborhoodService;
  PlaceBombsAction(this.indexClicked) {
    _neighborhoodService = NeighborhoodService(boardState.horizontalTiles, boardState.verticalTiles);
  }

   @override
  BoardState reduceBoardState() {
    var bombIndexes = _generateBombIndexes();
    var tiles = _generateTilesWithBombs(bombIndexes);
    return boardState.copy(
      tiles: tiles,
    );
  }

  List<int> _generateBombIndexes(){
    var nTiles = verticalTiles * horizontalTiles;
    var bombIndexes = List<int>.generate(nTiles, (index) => index); //Gera uma lista com todos os indexes possíveis para posicionar bombas
    var validNeighbors = _neighborhoodService.getNeighborsIndexes(indexClicked);
    for (var neighborIndex in validNeighbors){
      bombIndexes.remove(neighborIndex); //Remove o index de todos os vizinhos
    }
    bombIndexes.remove(indexClicked); //Remove o index da casa clicada pelo usuário

    for (var i = 1; i < nTiles - numberOfBombs - validNeighbors.length; i++){
      bombIndexes.removeAt(Random().nextInt(bombIndexes.length)); 
    }
    return bombIndexes;
  }

  List<Tile> _generateTilesWithBombs(List<int> bombIndexes){
    var tiles = List<Tile>.generate(verticalTiles*horizontalTiles, (int index){
      if (bombIndexes.contains(index)){
        return Tile(content: TileContent.bomb, state: TileState.none);
      }
      return Tile(content: TileContent.empty, state: TileState.none);
    });
    return tiles;
  }

}
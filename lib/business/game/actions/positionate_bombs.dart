import 'dart:math';

import 'package:async_redux/async_redux.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';

class PositionateBombsAction extends ReduxAction<GameState> {
  PositionateBombsAction(this.indexClicked);
  final int indexClicked;

   GameState reduce() {
    List<int> bombIndexes = _generateBombIndexes();
    List<Tile> tilesWithBombs = _generateTilesWithBombs(bombIndexes);
    List<Tile> tiles = _putNumbersOnTiles(tilesWithBombs);
    return state.copy(
      tiles: tiles,
      initializated: true
    );
  }

  List<int> _generateBombIndexes(){
    int nTiles = state.verticalTiles * state.horizontalTiles;
    var bombIndexes = List<int>.generate(nTiles, (index) => index); //Gera uma lista com todos os indexes possíveis para posicionar bombas
    var validNeighbors = _getValidNeighborsIndexes(indexClicked);
    for (int i = 0; i < validNeighbors.length; i++){
      bombIndexes.remove(validNeighbors.elementAt(i)); //Remove o index de todos os vizinhos
    }
    bombIndexes.remove(indexClicked); //Remove o index da casa clicada pelo usuário

    for (int i = 1; i < nTiles - state.numberOfBombs - validNeighbors.length; i++){
      bombIndexes.removeAt(Random().nextInt(bombIndexes.length)); 
    }
    return bombIndexes;
  }

  List<Tile> _generateTilesWithBombs(List<int> bombIndexes){
    var tiles = List<Tile>.generate(state.verticalTiles*state.horizontalTiles, (int index){
      if (bombIndexes.contains(index)){
        return Tile(content: TileContent.bomb, state: TileState.none);
      }
      return Tile(content: TileContent.empty, state: TileState.none);
    });
    return tiles;
  }

  List<Tile> _putNumbersOnTiles(List<Tile> tiles){
    var newTiles = List<Tile>.generate(tiles.length, (index){
      var currentTile = tiles.elementAt(index);
      if (currentTile.content == TileContent.bomb) return currentTile;
      else {
        int ammountOfBombsInNeighborhood = _getAmmountOfBombsInNeighborhood(tiles, index);
        TileContent content = _getTileContent(ammountOfBombsInNeighborhood);
        return Tile(content: content, state: TileState.none);
      }
    });
    return newTiles;
  }

  TileContent _getTileContent(int ammount) {
    return TileContent.values.elementAt(ammount);
  }

  int _getAmmountOfBombsInNeighborhood(List<Tile> tiles, int index){
    int result = 0;
    var validNeighborsIndexes = _getValidNeighborsIndexes(index);
    for (int i = 0; i < validNeighborsIndexes.length; i++){
      if (tiles.elementAt(validNeighborsIndexes.elementAt(i)).content == TileContent.bomb) result++;
    }
    return result;
  }

  List<int> _getValidNeighborsIndexes(int index) {
    return _getNeighborsIndexes(index).where((neighborIndex) => _validateNeighborIndex(neighborIndex)).toList();
  }

  List<int> _getNeighborsIndexes(int index){
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
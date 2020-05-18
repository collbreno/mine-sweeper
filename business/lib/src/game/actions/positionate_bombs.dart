import 'dart:math';
import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';


// Essa ação é disparada quando o usuário clica na sua primeira casa
class PositionateBombsAction extends ReduxAction<GameState> {
  PositionateBombsAction(this.indexClicked);
  final int indexClicked;

   @override
  GameState reduce() {
    List<int> bombIndexes = _generateBombIndexes();
    List<Tile> tiles = _generateTilesWithBombs(bombIndexes);
    return state.copy(
      tiles: tiles,
    );
  }

  List<int> _generateBombIndexes(){
    int nTiles = state.verticalTiles * state.horizontalTiles;
    var bombIndexes = List<int>.generate(nTiles, (index) => index); //Gera uma lista com todos os indexes possíveis para posicionar bombas
    var validNeighbors = NeighborhoodService(state).getNeighborsIndexes(indexClicked);
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

}
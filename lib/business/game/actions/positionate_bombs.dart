import 'dart:math';

import 'package:async_redux/async_redux.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';

class PositionateBombs extends ReduxAction<GameState> {
  PositionateBombs(this.indexClicked);
  final int indexClicked;

   GameState reduce() {
    List<int> bombIndexes = _generateBombIndexes();
    List<Tile> tiles = _generateTiles(bombIndexes);
    return state.copy(
      tiles: tiles,
      initializated: true
    );
  }

  List<int> _generateBombIndexes(){
    int nTiles = state.verticalTiles * state.horizontalTiles;
    var bombIndexes = List<int>.generate(nTiles, (index) => index); //Gera uma lista com todos os indexes possíveis para posicionar bombas
    bombIndexes.removeAt(indexClicked); //Remove o index da casa clicada pelo usuário
    for (int i = 1; i < nTiles - state.numberOfBombs; i++){
      bombIndexes.removeAt(Random().nextInt(bombIndexes.length)); 
    }
    return bombIndexes;
  }

  List<Tile> _generateTiles(List<int> bombIndexes){
    var tiles = List<Tile>.generate(state.verticalTiles*state.horizontalTiles, (int index){
      if (bombIndexes.contains(index)){
        return Tile(content: TileContent.bomb, state: TileState.none);
      }
      return Tile(content: TileContent.empty, state: TileState.none);
    });
    return tiles;
  }
}
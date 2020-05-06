import 'package:async_redux/async_redux.dart';
import '../models/game_state.dart';
import 'dart:math';

class InitBoardAction extends ReduxAction<GameState> {
  InitBoardAction({this.numberOfBombs, this.horizontalTiles, this.verticalTiles});
  final int numberOfBombs;
  final int verticalTiles;
  final int horizontalTiles;

  GameState reduce() {
    List<int> bombIndexes = _generateBombIndexes();
    List<Tile> tiles = _generateTiles(bombIndexes);
    return state.copy(
      horizontalTiles: this.horizontalTiles,
      numberOfBombs: this.numberOfBombs,
      verticalTiles: this.verticalTiles,
      tiles: tiles
    );
  }

  List<int> _generateBombIndexes(){
    int nTiles = verticalTiles * horizontalTiles;
    var bombIndexes = List<int>.generate(nTiles, (index) => index);
    for (int i = 0; i < nTiles - numberOfBombs; i++){
      bombIndexes.removeAt(Random().nextInt(bombIndexes.length));
    }
    return bombIndexes;
  }

  List<Tile> _generateTiles(List<int> bombIndexes){
    var tiles = List<Tile>.generate(verticalTiles*horizontalTiles, (int index){
      if (bombIndexes.contains(index)){
        return Tile(content: TileContent.bomb, state: TileState.none);
      }
      return Tile(content: TileContent.empty, state: TileState.none);
    });
    return tiles;
  }
}
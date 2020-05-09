import 'package:async_redux/async_redux.dart';
import 'package:mine_sweeper/business/game/models/tile.dart';

class GameState {
  final int horizontalTiles;
  final int verticalTiles;
  final int numberOfBombs;
  final List<Tile> tiles;
  final bool initializated;
  final Event showVictoryDialogEvt;

  GameState({
    this.horizontalTiles,
    this.verticalTiles,
    this.numberOfBombs,
    this.tiles,
    this.initializated,
    this.showVictoryDialogEvt
  });

  GameState copy({ 
    int horizontalTiles, 
    int verticalTiles, 
    int numberOfBombs, 
    List<Tile>tiles,
    bool initializated,
    Event showVictoryDialogEvt
  }) {
    return GameState(
      horizontalTiles: horizontalTiles ?? this.horizontalTiles,
      numberOfBombs: numberOfBombs ?? this.numberOfBombs,
      verticalTiles: verticalTiles ?? this.verticalTiles,
      tiles: tiles ?? this.tiles,
      initializated: initializated ?? this.initializated,
      showVictoryDialogEvt: showVictoryDialogEvt ?? this.showVictoryDialogEvt
    );
  }

  static GameState initialState() => 
    GameState(
      horizontalTiles: 0,
      verticalTiles: 0,
      numberOfBombs: 0,
      tiles: List<Tile>(),
      initializated: false,
      showVictoryDialogEvt: Event.spent()
    );

  @override
  bool operator ==(Object other) => 
    identical(this, other) || other is GameState && runtimeType == other.runtimeType &&
                              tiles == other.tiles && 
                              tiles.map((tile) => tile.content) == other.tiles.map((tile) => tile.content) &&
                              horizontalTiles == other.horizontalTiles && 
                              verticalTiles == other.verticalTiles && 
                              initializated == other.initializated &&
                              numberOfBombs == other.numberOfBombs;

  @override
  int get hashCode => horizontalTiles.hashCode ^ 
                      verticalTiles.hashCode ^ 
                      numberOfBombs.hashCode ^ 
                      initializated.hashCode ^
                      tiles.map((tile) => tile.content).hashCode ^
                      tiles.map((tile) => tile.state).hashCode;
}

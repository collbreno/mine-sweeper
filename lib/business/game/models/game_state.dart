class GameState {
  final int horizontalTiles;
  final int verticalTiles;
  final int numberOfBombs;
  final List<Tile> tiles;

  GameState({
    this.horizontalTiles,
    this.verticalTiles,
    this.numberOfBombs,
    this.tiles
  });

  GameState copy({ int horizontalTiles, int verticalTiles, int numberOfBombs, tiles }) {
    return GameState(
      horizontalTiles: horizontalTiles ?? this.horizontalTiles,
      numberOfBombs: numberOfBombs ?? this.numberOfBombs,
      verticalTiles: verticalTiles ?? this.verticalTiles,
      tiles: tiles ?? this.tiles
    );
  }

  static GameState initialState() => 
    GameState(
      horizontalTiles: 0,
      verticalTiles: 0,
      numberOfBombs: 0,
      tiles: List<Tile>()
    );

  @override
  bool operator ==(Object other) => 
    identical(this, other) || other is GameState && runtimeType == other.runtimeType &&
                              tiles == other.tiles && 
                              tiles.map((tile) => tile.content) == other.tiles.map((tile) => tile.content) &&
                              horizontalTiles == other.horizontalTiles && 
                              verticalTiles == other.verticalTiles && 
                              numberOfBombs == other.numberOfBombs;

  @override
  int get hashCode => horizontalTiles.hashCode ^ 
                      verticalTiles.hashCode ^ 
                      numberOfBombs.hashCode ^ 
                      tiles.map((tile) => tile.content).hashCode ^
                      tiles.map((tile) => tile.state).hashCode;
}

class Tile {
  final TileState state;
  final TileContent content;

  Tile({this.state, this.content});
}

enum TileState {
  flag,
  discovered,
  none
}

enum TileContent {
  empty,
  bomb,
  number
}
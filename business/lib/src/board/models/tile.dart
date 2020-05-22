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
  number1,
  number2,
  number3,
  number4,
  number5,
  number6,
  number7,
  number8,
  bomb,
}
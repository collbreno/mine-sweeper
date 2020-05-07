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
  number_1,
  number_2,
  number_3,
  number_4,
  number_5,
  number_6,
  number_7,
  number_8,
  bomb,
}
class BoardSpecs {
  BoardSpecs({
    this.horizontalTiles,
    this.verticalTiles,
    this.numberOfBombs,
    this.tilesContent,
    this.tilesState,
  });

  final int horizontalTiles;
  final int verticalTiles;
  final int numberOfBombs;
  final String tilesState;
  final String tilesContent;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (horizontalTiles != null) map['horizontalTiles'] = horizontalTiles;
    if (verticalTiles != null) map['verticalTiles'] = verticalTiles;
    if (numberOfBombs != null) map['numberOfBombs'] = numberOfBombs;
    if (tilesContent != null) map['tilesContent'] = tilesContent;
    if (tilesState != null) map['tilesState'] = tilesState;
    return map;
  }
}

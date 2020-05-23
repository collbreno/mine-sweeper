import 'package:business/business.dart';

class BoardSpecs {
  BoardSpecs({
    this.horizontalTiles,
    this.verticalTiles,
    this.numberOfBombs,
    this.tilesToDiscover,
    this.tilesContent,
    this.tilesState,
    this.gameProgress
  });

  final int horizontalTiles;
  final int verticalTiles;
  final int numberOfBombs;
  final String tilesState;
  final String tilesContent;
  final int tilesToDiscover;
  final GameProgress gameProgress;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (horizontalTiles != null) map['horizontalTiles'] = horizontalTiles;
    if (verticalTiles != null) map['verticalTiles'] = verticalTiles;
    if (numberOfBombs != null) map['numberOfBombs'] = numberOfBombs;
    if (tilesContent != null) map['tilesContent'] = tilesContent;
    if (tilesState != null) map['tilesState'] = tilesState;
    if (tilesToDiscover != null) map['tilesToDiscover'] = tilesToDiscover;
    if (gameProgress != null) map['gameProgress'] = gameProgress.index;
    return map;
  }

  static BoardSpecs fromObject(dynamic o) {
    return BoardSpecs(
      horizontalTiles: o['horizontalTiles'],
      verticalTiles: o['verticalTiles'],
      numberOfBombs: o['numberOfBombs'],
      tilesContent: o['tilesContent'],
      tilesState: o['tilesState'],
      tilesToDiscover: o['tilesToDiscover'],
      gameProgress: GameProgress.values.elementAt(o['gameProgress']),
    );
  }

}

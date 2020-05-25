import 'package:business/business.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BoardCloudSpecs {
  BoardCloudSpecs({
    this.boardSize,
    this.numberOfBombs,
    this.tilesToDiscover,
    this.tilesContent,
    this.tilesState,
    this.gameProgress,
    this.startTime,
    this.finishTime,
  });

  final BoardSize boardSize;
  final int numberOfBombs;
  final String tilesState;
  final String tilesContent;
  final int tilesToDiscover;
  final GameProgress gameProgress;
  final DateTime startTime;
  final DateTime finishTime;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (boardSize != null) map['horizontalTiles'] = boardSize.width;
    if (boardSize != null) map['verticalTiles'] = boardSize.height;
    if (numberOfBombs != null) map['numberOfBombs'] = numberOfBombs;
    if (tilesContent != null) map['tilesContent'] = tilesContent;
    if (tilesState != null) map['tilesState'] = tilesState;
    if (tilesToDiscover != null) map['tilesToDiscover'] = tilesToDiscover;
    if (gameProgress != null) map['gameProgress'] = gameProgress.index;
    if (startTime != null) map['startTime'] = startTime;
    if (finishTime != null) map['finishTime'] = finishTime;
    return map;
  }

  static BoardCloudSpecs fromObject(dynamic o) {
    var boardSize = BoardSize(height: 0, width: 0);
    if (o['horizontalTiles'] != null && o['verticalTiles'] != null) {
      boardSize = BoardSize(height: o['verticalTiles'], width: o['horizontalTiles']);
    }
    return BoardCloudSpecs(
      boardSize: boardSize,
      numberOfBombs: o['numberOfBombs'],
      tilesContent: o['tilesContent'],
      tilesState: o['tilesState'],
      tilesToDiscover: o['tilesToDiscover'],
      startTime: o['startTime']?.toDate(),
      finishTime: o['finishTime']?.toDate(),
      gameProgress: GameProgress.values.elementAt(o['gameProgress']),
    );
  }

}

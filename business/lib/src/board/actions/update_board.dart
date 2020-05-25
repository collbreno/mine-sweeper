import 'dart:async';

import 'package:business/business.dart';

class UpdateBoardAction extends BoardAction {
  UpdateBoardAction(this.boardSpecs);
  final BoardCloudSpecs boardSpecs;


  @override
  BoardState reduceBoardState() {
    return boardState.copy(
      boardSize: boardSpecs.boardSize,
      gameProgress: boardSpecs.gameProgress,
      startTime: boardSpecs.startTime,
      finishTime: boardSpecs.finishTime,
      numberOfBombs: boardSpecs.numberOfBombs,
      tiles: ConverterHelper.createTilesFromString(boardSpecs.tilesState, boardSpecs.tilesContent)
    );
  }

}
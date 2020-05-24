import 'dart:async';

import 'package:business/business.dart';

class UpdateBoardAction extends BoardAction {
  UpdateBoardAction(this.boardSpecs);
  final BoardCloudSpecs boardSpecs;


  @override
  BoardState reduceBoardState() {
    return boardState.copy(
      boardSize: boardSize,
      gameProgress: boardSpecs.gameProgress,
      numberOfBombs: boardSpecs.numberOfBombs,
      tiles: ConverterHelper.createTilesFromString(boardSpecs.tilesState, boardSpecs.tilesContent)
    );
  }

}
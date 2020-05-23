import 'dart:async';

import 'package:business/business.dart';

class UpdateBoardAction extends BoardAction {
  UpdateBoardAction(this.boardSpecs);
  final BoardSpecs boardSpecs;


  @override
  BoardState reduceBoardState() {
    return boardState.copy(
      horizontalTiles: boardSpecs.horizontalTiles,
      verticalTiles: boardSpecs.verticalTiles,
      gameProgress: boardSpecs.gameProgress,
      numberOfBombs: boardSpecs.numberOfBombs,
      tiles: ConverterHelper.createTilesFromString(boardSpecs.tilesState, boardSpecs.tilesContent)
    );
  }

}
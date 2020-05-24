import 'dart:async';

import 'package:business/business.dart';

class ShareGameAction extends CloudAction {
  @override
  Future<CloudState> reduceCloudState() async {
    dispatch(SetShareCodeToLoadingAction());
    var shareCode = await FirestoreService().createGame(_getBoardSpecs());
    return cloudState.copy(shareCode: AsyncData<String>.withData(shareCode));
  }

  @override
  void after() {
    if (gameProgress == GameProgress.inProgress ||
        gameProgress == GameProgress.user_lost ||
        gameProgress == GameProgress.user_won) {
      dispatch(UpdateTilesStateAction());
      dispatch(UpdateTilesContentAction());
      dispatch(UpdateTilesToDiscoverAction());
      dispatch(UpdateNumberOfBombsAction());
      dispatch(UpdateGameProgressAction());
    }
  }

  BoardSpecs _getBoardSpecs() {
    return BoardSpecs(
        horizontalTiles: horizontalTiles,
        numberOfBombs: numberOfBombs,
        verticalTiles: verticalTiles);
  }
}

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
    dispatch(UpdateTilesContentAction());
    dispatch(UpdateStartTimeAction());
    dispatch(UpdateFinishTimeAction());
    dispatch(UpdateTilesStateAction());
    dispatch(UpdateTilesToDiscoverAction());
    dispatch(UpdateNumberOfBombsAction());
    dispatch(UpdateGameProgressAction());
  }

  BoardCloudSpecs _getBoardSpecs() {
    return BoardCloudSpecs(
      boardSize: boardSize,
      numberOfBombs: numberOfBombs,
    );
  }
}

import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';
import 'package:business/src/firebase/actions/set_share_code_to_loading.dart';

class ShareNewGameAction extends CloudAction {
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

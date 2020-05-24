import 'package:business/business.dart';

class UpdateGameProgressAction extends CloudAction {

  @override
  Future<CloudState> reduceCloudState() async {
    if (!shareCode.hasData) return null;
    var boardSpecs = BoardCloudSpecs(gameProgress: gameProgress);
    await FirestoreService().updateGame(shareCode.data, boardSpecs);
    return null;
  }

  @override
  void before() {
    dispatch(SetSyncStatusAction(
        syncStatus.copy(isSyncingGameProgress: true)
    ));
  }

  @override
  void after() {
    dispatch(SetSyncStatusAction(
        syncStatus.copy(isSyncingGameProgress: false)
    ));
  }

}
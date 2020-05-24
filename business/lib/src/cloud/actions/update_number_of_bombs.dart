import 'package:business/business.dart';

class UpdateNumberOfBombsAction extends CloudAction {

  @override
  Future<CloudState> reduceCloudState() async {
    if (!shareCode.hasData) return null;
    var boardSpecs = BoardCloudSpecs(numberOfBombs: numberOfBombs);
    await FirestoreService().updateGame(shareCode.data, boardSpecs);
    return null;
  }


  @override
  void before() {
    dispatch(SetSyncStatusAction(
        syncStatus.copy(isSyncingNumberOfBombs: true)
    ));
  }

  @override
  void after() {
    dispatch(SetSyncStatusAction(
        syncStatus.copy(isSyncingNumberOfBombs: false)
    ));
  }

}
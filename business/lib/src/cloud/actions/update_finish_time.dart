import 'package:business/business.dart';

class UpdateFinishTimeAction extends CloudAction {

  @override
  Future<CloudState> reduceCloudState() async {
    if (!shareCode.hasData) return null;
    var boardSpecs = BoardCloudSpecs(finishTime: DateTime.now());
    await FirestoreService().updateGame(shareCode.data, boardSpecs);
    return null;
  }


  @override
  void before() {
    dispatch(SetSyncStatusAction(
        syncStatus.copy(isSyncingFinishTime: true)
    ));
  }

  @override
  void after() {
    dispatch(SetSyncStatusAction(
        syncStatus.copy(isSyncingFinishTime: false)
    ));
  }

}
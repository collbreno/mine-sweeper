import 'package:business/business.dart';

class UpdateTilesToDiscoverAction extends CloudAction {

  @override
  Future<CloudState> reduceCloudState() async {
    if (!shareCode.hasData) return null;
    var boardSpecs = BoardCloudSpecs(tilesToDiscover: tilesToDiscover);
    await FirestoreService().updateGame(shareCode.data, boardSpecs);
    return null;
  }


  @override
  void before() {
    dispatch(SetSyncStatusAction(
        syncStatus.copy(isSyncingTilesToDiscover: true)
    ));
  }

  @override
  void after() {
    dispatch(SetSyncStatusAction(
        syncStatus.copy(isSyncingTilesToDiscover: false)
    ));
  }

}
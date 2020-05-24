import 'package:business/business.dart';

class UpdateTilesStateAction extends CloudAction {

  @override
  Future<CloudState> reduceCloudState() async {
    if (!shareCode.hasData) return null;
    var tilesState = ConverterHelper.convertTilesStateToString(tiles);
    var boardSpecs = BoardSpecs(tilesState: tilesState);
    await FirestoreService().updateGame(shareCode.data, boardSpecs);
    return null;
  }


  @override
  void before() {
    dispatch(SetSyncStatusAction(
        syncStatus.copy(isSyncingTilesState: true)
    ));
  }

  @override
  void after() {
    dispatch(SetSyncStatusAction(
        syncStatus.copy(isSyncingTilesState: false)
    ));
  }

}
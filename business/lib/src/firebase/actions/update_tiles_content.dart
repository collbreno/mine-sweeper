import 'package:business/business.dart';

class UpdateTilesContentAction extends CloudAction {

  @override
  Future<CloudState> reduceCloudState() async {
    if (!shareCode.hasData) return null;
    var tilesContent = ConverterHelper.convertTilesContentToString(tiles);
    var boardSpecs = BoardSpecs(tilesContent: tilesContent);
    await FirestoreService().updateGame(shareCode.data, boardSpecs);
    return null;
  }

  @override
  void before() {
    dispatch(SetSyncStatusAction(
        syncStatus.copy(isSyncingTilesContent: true)
    ));
  }

  @override
  void after() {
    dispatch(SetSyncStatusAction(
        syncStatus.copy(isSyncingTilesContent: false)
    ));
  }

}
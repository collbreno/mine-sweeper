import 'package:business/business.dart';

class UpdateTilesState extends CloudAction {

  @override
  CloudState reduceCloudState() {
    if (!shareCode.hasData) return null;
    var tilesState = ConverterHelper.convertTilesStateToString(tiles);
    var boardSpecs = BoardSpecs(tilesState: tilesState);
    FirestoreService().updateGame(shareCode.data, boardSpecs);
    return null;
  }

}
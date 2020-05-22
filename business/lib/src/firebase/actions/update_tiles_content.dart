import 'package:business/business.dart';

class UpdateTilesContent extends CloudAction {

  @override
  CloudState reduceCloudState() {
    if (!shareCode.hasData) return null;
    var tilesContent = ConverterHelper.convertTilesContentToString(tiles);
    var boardSpecs = BoardSpecs(tilesContent: tilesContent);
    FirestoreService().updateGame(shareCode.data, boardSpecs);
    return null;
  }

}
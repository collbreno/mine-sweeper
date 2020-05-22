import 'package:business/business.dart';

class UpdateTilesToDiscover extends CloudAction {

  @override
  CloudState reduceCloudState() {
    if (!shareCode.hasData) return null;
    var boardSpecs = BoardSpecs(tilesToDiscover: tilesToDiscover);
    FirestoreService().updateGame(shareCode.data, boardSpecs);
    return null;
  }

}
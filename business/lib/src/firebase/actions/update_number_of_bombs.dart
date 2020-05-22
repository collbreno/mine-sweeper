import 'package:business/business.dart';

class UpdateNumberOfBombs extends CloudAction {

  @override
  CloudState reduceCloudState() {
    if (!shareCode.hasData) return null;
    var boardSpecs = BoardSpecs(numberOfBombs: numberOfBombs);
    FirestoreService().updateGame(shareCode.data, boardSpecs);
    return null;
  }

}
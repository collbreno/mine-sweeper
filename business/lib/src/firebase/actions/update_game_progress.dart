import 'package:business/business.dart';

class UpdateGameProgress extends CloudAction {

  @override
  CloudState reduceCloudState() {
    if (!shareCode.hasData) return null;
    var boardSpecs = BoardSpecs(gameProgress: gameProgress);
    FirestoreService().updateGame(shareCode.data, boardSpecs);
    return null;
  }

}
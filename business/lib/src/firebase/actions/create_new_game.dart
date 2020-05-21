import 'package:business/business.dart';

class CreateNewGameAction extends CloudAction {

  @override
  CloudState reduceCloudState() {
    return cloudState.copy(
        shareCode: AsyncData<String>.nothing()
    );
  }
}
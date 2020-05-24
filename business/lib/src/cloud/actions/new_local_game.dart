import 'package:business/business.dart';

class NewLocalGameAction extends CloudAction {

  @override
  CloudState reduceCloudState() {
    return cloudState.copy(
        shareCode: AsyncData<String>.nothing(),
        isRemote: false
    );
  }
}
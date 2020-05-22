import 'package:business/business.dart';

class SetShareCodeToLoadingAction extends CloudAction {

  @override
  CloudState reduceCloudState() {
    return cloudState.copy(
        shareCode: AsyncData<String>.waiting()
    );
  }
}
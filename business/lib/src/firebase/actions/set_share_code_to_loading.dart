import 'package:business/business.dart';

class SetShareCodeToLoading extends CloudAction {

  @override
  CloudState reduceCloudState() {
    return cloudState.copy(
        shareCode: AsyncData<String>.waiting()
    );
  }
}
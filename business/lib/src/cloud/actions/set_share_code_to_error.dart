import 'package:business/business.dart';

class SetShareCodeToErrorAction extends CloudAction {

  @override
  CloudState reduceCloudState() {
    return cloudState.copy(
        shareCode: AsyncData<String>.withError()
    );
  }
}
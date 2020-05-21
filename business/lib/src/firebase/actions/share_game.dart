import 'package:business/business.dart';

class ShareGameAction extends CloudAction {
  @override
  CloudState reduceCloudState() {
    print('share game');
    if (!shareCode.hasData) {
      dispatch(ShareNewGameAction());
    }
    return null;
  }


}
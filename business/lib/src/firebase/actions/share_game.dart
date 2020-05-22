import 'package:business/business.dart';

class ShareGameAction extends CloudAction {
  @override
  CloudState reduceCloudState() { // TODO: implementar dialog de share
    print('share game');
    if (!shareCode.hasData) {
      dispatch(ShareNewGameAction());
    }
    return null;
  }


}
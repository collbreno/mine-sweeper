
import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';

class ShowPromptDialogAction extends CloudAction {
  @override
  CloudState reduceCloudState() {
    return cloudState.copy(
      promptDialogIsVisible: true
    );
  }

}
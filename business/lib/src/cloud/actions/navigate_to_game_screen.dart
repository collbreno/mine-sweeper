import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';

class NavigateToGameScreenAction extends CloudAction {
  @override
  CloudState reduceCloudState() {
    return cloudState.copy(
      navigateEvt: Event()
    );
  }

}
import 'dart:async';

import 'package:business/business.dart';

abstract class CloudAction extends BaseAction {
  FutureOr<CloudState> reduceCloudState();

  @override
  FutureOr<AppState> reduce() {
    var cloudState = reduceCloudState();
    if (cloudState is Future) {
      return (cloudState as Future)
          .then((_cloudState) => state.copy(cloudState: _cloudState));
    }

    return (cloudState == null) ? null : state.copy(cloudState: cloudState);
  }
}

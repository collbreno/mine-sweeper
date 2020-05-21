import 'dart:async';

import 'package:business/business.dart';

abstract class CloudAction extends BaseAction {
  CloudState reduceCloudState();

  @override
  AppState reduce() {
    var cloudState = reduceCloudState();
    return (cloudState == null) ? null : state.copy(cloudState: cloudState);
  }
}
import 'dart:async';

import 'package:business/business.dart';

abstract class CloudFutureAction extends BaseAction {
  Future<CloudState> reduceCloudState();

  @override
  Future<AppState> reduce() async {
    var cloudState = await reduceCloudState();
    return (cloudState == null) ? null : state.copy(cloudState: cloudState);
  }
}
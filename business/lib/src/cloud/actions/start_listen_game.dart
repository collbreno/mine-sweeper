import 'dart:async';

import 'package:business/business.dart';

class StartListenGameAction extends CloudAction {
  StartListenGameAction(this.id);
  final String id;
  final _stopwatchService = StopwatchService();

  @override
  CloudState reduceCloudState() {
    _stopwatchService.start(() => dispatch(UpdateTimeElapsed()));
    FirestoreService().getGameStream(id).listen((boardSpecs){
      if (finishTime == null && boardSpecs.finishTime != null) {
        _stopwatchService.stop();
        dispatch(UpdateBoardAction(boardSpecs));
        dispatch(UpdateTimeElapsed());
      }
      dispatch(UpdateBoardAction(boardSpecs));
    });
    return cloudState.copy(
      isRemote: true,
      shareCode: AsyncData.withData(id)
    );
  }

}
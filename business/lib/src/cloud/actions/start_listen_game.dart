import 'dart:async';

import 'package:business/business.dart';

class StartListenGameAction extends CloudAction {
  StartListenGameAction(this.id);
  final String id;

  @override
  CloudState reduceCloudState() {
    FirestoreService().getGameStream(id).listen((boardSpecs){
      dispatch(UpdateBoardAction(boardSpecs));
    });
    return cloudState.copy(
      isRemote: true,
      shareCode: AsyncData.withData(id)
    );
  }

}
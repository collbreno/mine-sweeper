import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';
import 'package:business/src/firebase/actions/set_share_code_to_loading.dart';

class ShareNewGameAction extends CloudFutureAction {
  @override
  Future<CloudState> reduceCloudState() async {
    dispatch(SetShareCodeToLoading());
    var shareCode = await FirestoreService().createGame(_getBoardSpecs());
    print('firestore document id $shareCode');
    return cloudState.copy(
      shareCode: AsyncData<String>.withData(shareCode)
    );
  }

  BoardSpecs _getBoardSpecs() {
    return BoardSpecs(
      horizontalTiles: horizontalTiles,
      numberOfBombs: numberOfBombs,
      verticalTiles: verticalTiles
    );
  }

}
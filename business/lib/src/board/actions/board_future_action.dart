import 'dart:async';

import '../../../business.dart';

abstract class BoardFutureAction extends BaseAction {
  Future<BoardState> reduceBoardState();

  @override
  Future<AppState> reduce() async {
    var boardState = await reduceBoardState();
    return (boardState == null) ? null : state.copy(boardState: boardState);
  }

}
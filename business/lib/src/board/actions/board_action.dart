import 'dart:async';

import '../../../business.dart';

abstract class BoardAction extends BaseAction {
  FutureOr<BoardState> reduceBoardState();

  @override
  FutureOr<AppState> reduce() {
    var boardState = reduceBoardState();
    if (boardState is Future) {
      return (boardState as Future)
          .then((_boardState) => state.copy(boardState: _boardState));
    }

    return (boardState == null) ? null : state.copy(boardState: boardState);
  }
}

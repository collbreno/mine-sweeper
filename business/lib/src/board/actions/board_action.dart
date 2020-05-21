
import '../../../business.dart';

abstract class BoardAction extends BaseAction {
  BoardState reduceBoardState();

  @override
  AppState reduce() {
    var boardState = reduceBoardState();
    return (boardState == null) ? null : state.copy(boardState: boardState);
  }

}
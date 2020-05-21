import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';

class SetTimeElapsedAction extends BoardAction {
  SetTimeElapsedAction(this.newTimeElapsed);
  final Duration newTimeElapsed;

  @override
  BoardState reduceBoardState() {
    return boardState.copy(
      timeElapsed: newTimeElapsed
    );
  }
}
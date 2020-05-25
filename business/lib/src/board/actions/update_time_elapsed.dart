import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';

class UpdateTimeElapsed extends BoardAction {
  @override
  BoardState reduceBoardState() {
    var newTimeElapsed = startTime != null
        ? (finishTime ?? DateTime.now()).difference(startTime)
        : Duration();
    return boardState.copy(
      timeElapsed: newTimeElapsed,
    );
  }
}

import 'package:business/business.dart';

class StartStopwatchAction extends BoardAction {
  StartStopwatchAction();

  @override
  BoardState reduceBoardState() {
    StopwatchService()
        .start(() => dispatch(UpdateTimeElapsed()));
    return boardState.copy(
      startTime: DateTime.now(),
    );
  }
}

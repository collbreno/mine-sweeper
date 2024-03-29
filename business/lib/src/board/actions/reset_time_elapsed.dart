
import 'dart:async';

import 'package:business/business.dart';

class ResetTimeElapsedAction extends BoardAction {
  @override
  BoardState reduceBoardState() {
    StopwatchService().stop();
    return boardState.copy(
      timeElapsed: Duration()
    );
  }

}
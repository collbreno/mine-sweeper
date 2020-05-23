
import 'dart:async';

import 'package:business/business.dart';

class ResetTimeElapsedAction extends BoardAction {
  @override
  BoardState reduceBoardState() {
    StopwatchService().stopAndReset();
    return boardState.copy(
      timeElapsed: Duration()
    );
  }

}
import 'dart:async';

import 'package:business/business.dart';

class CleanBoardAction extends BoardAction {
  @override
  BoardState reduceBoardState() {
    StopwatchService().stop();
    return BoardState.initialState();
  }

}
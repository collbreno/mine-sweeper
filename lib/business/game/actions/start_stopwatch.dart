import 'package:async_redux/async_redux.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';
import 'package:mine_sweeper/business/game/services/stopwatch_service.dart';

class StartStopwatchAction extends ReduxAction<GameState> {
  StartStopwatchAction();

  GameState reduce(){
    StopwatchService().start();
    return null;
  }
}
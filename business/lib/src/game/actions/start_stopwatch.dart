import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';

class StartStopwatchAction extends ReduxAction<GameState> {
  StartStopwatchAction();

  @override
  GameState reduce(){
    StopwatchService().start();
    return null;
  }
}
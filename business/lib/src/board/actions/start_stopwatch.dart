import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';

class StartStopwatchAction extends BoardAction {
  StartStopwatchAction();

  @override
  BoardState reduceBoardState(){
    StopwatchService().start();
    return null;
  }
}
import 'dart:async';
import 'dart:io';

import 'package:mine_sweeper/business/game/actions/set_time_elapsed.dart';
import 'package:mine_sweeper/main.dart';

class StopwatchService {
  static final StopwatchService _instance = StopwatchService._internal();

  final Stopwatch _stopwatch = Stopwatch();
  
  StopwatchService._internal();

  factory StopwatchService() {
    return _instance;
  }

  void start(){
    _stopwatch.start();
    _updateStateWhileRunning();
  }

  void stopAndReset() {
    _stopwatch.stop();
    _stopwatch.reset();
    _updateState();
  }

  void stop() {
    _stopwatch.stop();
  }

  void _updateStateWhileRunning(){
    _updateState();
    var duration = Duration(seconds: 1);
    Timer(duration, (){
      if (_stopwatch.isRunning) {
        _updateStateWhileRunning();
      }
    }); // A cada um segundo, atualiza o State
  }

  void _updateState() {
    store.dispatch(SetTimeElapsedAction(_stopwatch.elapsed));
  }

}
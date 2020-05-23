import 'dart:async';

class StopwatchService {
  static final StopwatchService _instance = StopwatchService._internal();

  final Stopwatch _stopwatch = Stopwatch();
  
  StopwatchService._internal();

  factory StopwatchService() {
    return _instance;
  }

  void start(void Function(Duration) onUpdate){
    _stopwatch.start();
    _updateStateWhileRunning(onUpdate);
  }

  void stopAndReset() {
    _stopwatch.stop();
    _stopwatch.reset();
  }

  void stop() {
    _stopwatch.stop();
  }

  void _updateStateWhileRunning(void Function(Duration) onUpdate){
    onUpdate(_stopwatch.elapsed);
    var duration = Duration(seconds: 1);
    Timer(duration, (){
      if (_stopwatch.isRunning) {
        _updateStateWhileRunning(onUpdate);
      }
    }); // A cada um segundo, atualiza o State
  }


}
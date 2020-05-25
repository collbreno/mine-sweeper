import 'dart:async';

class StopwatchService {
  static final StopwatchService _instance = StopwatchService._internal();

  bool _isRunning;
  
  StopwatchService._internal();

  factory StopwatchService() {
    return _instance;
  }

  void start(void Function() onUpdate){
    _isRunning = true;
    _updateWhileRunning(onUpdate);
  }

  void stop() {
    _isRunning = false;
  }

  void _updateWhileRunning(void Function() onUpdate){
    onUpdate();
    var duration = Duration(seconds: 1);
    Timer(duration, (){
      if (_isRunning) {
        _updateWhileRunning(onUpdate);
      }
    });
  }


}
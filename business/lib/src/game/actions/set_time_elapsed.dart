import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';

class SetTimeElapsedAction extends ReduxAction<GameState> {
  SetTimeElapsedAction(this.timeElapsed);
  final Duration timeElapsed;

  @override
  GameState reduce() {
    return state.copy(
      timeElapsed: timeElapsed
    );
  }
}
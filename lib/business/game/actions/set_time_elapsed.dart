import 'package:async_redux/async_redux.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';

class SetTimeElapsedAction extends ReduxAction<GameState> {
  SetTimeElapsedAction(this.timeElapsed);
  final Duration timeElapsed;

  GameState reduce() {
    return state.copy(
      timeElapsed: timeElapsed
    );
  }
}
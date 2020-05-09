import 'package:async_redux/async_redux.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';

class ShowVictoryDialogAction extends ReduxAction<GameState> {
  @override
  GameState reduce() {
    return state.copy(showVictoryDialogEvt: Event());
  }
}
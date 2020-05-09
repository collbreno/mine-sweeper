import 'package:async_redux/async_redux.dart';
import 'package:mine_sweeper/business/game/actions/show_victory_dialog.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';

class CheckVictoryAction extends ReduxAction<GameState> {
  CheckVictoryAction();

  GameState reduce() {
    if (state.tilesToDiscover <= 0) dispatch(ShowVictoryDialogAction());
    return null;
  }

}
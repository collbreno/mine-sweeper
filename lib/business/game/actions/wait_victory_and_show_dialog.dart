import 'package:async_redux/async_redux.dart';
import 'package:mine_sweeper/business/game/actions/show_dialog.dart';
import 'package:mine_sweeper/business/game/models/game_progress.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';
import 'package:mine_sweeper/business/game/services/stopwatch_service.dart';

class WaitVictoryAndShowDialogAction extends ReduxAction<GameState> {
@override
  Future<GameState> reduce() async {
    await store.waitCondition((state) => state.tilesToDiscover <= 0 );
    dispatch(ShowDialogAction(DialogType.victory));
    StopwatchService().stop();
    return state.copy(
      gameProgress: GameProgress.user_won
    );
  }

}
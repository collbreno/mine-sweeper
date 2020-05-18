import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';

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
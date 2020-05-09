import 'package:async_redux/async_redux.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';

class ShowVictoryDialogAction extends ReduxAction<GameState> {
  @override
  Future<GameState> reduce() async {
    await store.waitCondition((state) => state.tilesToDiscover <= 0 );
    return state.copy(showVictoryDialogEvt: Event());
  }
}
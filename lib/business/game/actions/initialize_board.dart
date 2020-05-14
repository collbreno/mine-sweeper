import 'package:async_redux/async_redux.dart';
import 'package:mine_sweeper/business/game/actions/positionate_bombs.dart';
import 'package:mine_sweeper/business/game/actions/positionate_numbers.dart';
import 'package:mine_sweeper/business/game/actions/start_stopwatch.dart';
import 'package:mine_sweeper/business/game/actions/wait_victory_and_show_dialog.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';
import 'package:mine_sweeper/business/game/services/stopwatch_service.dart';


// Essa ação é disparada quando o usuário clica na sua primeira casa
class InitializeBoardAction extends ReduxAction<GameState> {
  InitializeBoardAction(this.indexClicked);
  final int indexClicked;

   GameState reduce() {
    dispatch(WaitVictoryAndShowDialogAction());
    dispatch(PositionateBombsAction(indexClicked));
    dispatch(PositionateNumbersAction());
    dispatch(StartStopwatchAction());
    StopwatchService().start();
    return state.copy(
      initializated: true
    );
  }


}
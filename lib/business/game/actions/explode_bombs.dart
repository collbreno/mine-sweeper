import 'package:async_redux/async_redux.dart';
import 'package:mine_sweeper/business/game/models/game_progress.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';
import 'package:mine_sweeper/business/game/services/stopwatch_service.dart';

// Essa ação é disparada quando o usuário clica em uma bomba, acabando o jogo
class ExplodeBombsAction extends ReduxAction<GameState> {

  GameState reduce() {
    StopwatchService().stop();
    return state.copy(
      gameProgress: GameProgress.user_lost,
      showDialogEvt: Event<DialogType>(DialogType.defeat)
    );
  }
}
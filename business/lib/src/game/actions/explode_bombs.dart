import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';

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
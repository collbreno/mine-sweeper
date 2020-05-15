import 'package:async_redux/async_redux.dart';
import 'package:mine_sweeper/business/game/models/game_progress.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';

class ShowDialogAction extends ReduxAction<GameState> {
  ShowDialogAction(this.dialogType);
  final DialogType dialogType;

  @override
  GameState reduce(){
    return state.copy(
      showDialogEvt: Event<DialogType>(dialogType)
    );
  }
}
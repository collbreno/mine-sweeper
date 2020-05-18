import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';

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
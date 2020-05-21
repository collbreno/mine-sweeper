import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';

class ShowDialogAction extends BoardAction {
  ShowDialogAction(this.dialogType);
  final DialogType dialogType;

  @override
  BoardState reduceBoardState(){
    return boardState.copy(
      showDialogEvt: Event<DialogType>(dialogType)
    );
  }
}
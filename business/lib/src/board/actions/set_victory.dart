import 'package:business/business.dart';

class SetVictoryAction extends BoardAction {
@override
  BoardState reduceBoardState() {
  dispatch(UpdateFinishTimeAction());
    dispatch(ShowDialogAction(DialogType.victory));
    StopwatchService().stop();
    return boardState.copy(
      gameProgress: GameProgress.user_won
    );
  }

  @override
  void after() => dispatch(UpdateGameProgressAction());

}
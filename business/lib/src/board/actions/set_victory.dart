import 'package:business/business.dart';

class SetVictoryAction extends BoardAction {
  @override
  BoardState reduceBoardState() {
    dispatch(ShowDialogAction(DialogType.victory));
    StopwatchService().stop();
    return boardState.copy(
      gameProgress: GameProgress.user_won,
      finishTime: DateTime.now(),
    );
  }

  @override
  void after() {
    dispatch(UpdateGameProgressAction());
    dispatch(UpdateFinishTimeAction());
  }
}

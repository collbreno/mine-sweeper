import 'package:business/business.dart';

class WaitVictoryAndShowDialogAction extends BoardFutureAction {
@override
  Future<BoardState> reduceBoardState() async {
    await store.waitCondition((state) => tilesToDiscover <= 0 );
    dispatch(ShowDialogAction(DialogType.victory));
    StopwatchService().stop();
    return boardState.copy(
      gameProgress: GameProgress.user_won
    );
  }

  @override
  void after() => dispatch(UpdateGameProgress());

}
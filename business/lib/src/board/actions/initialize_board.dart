import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';


// Essa ação é disparada quando o usuário clica na sua primeira casa
class InitializeBoardAction extends BoardAction {
  InitializeBoardAction(this.indexClicked);
  final int indexClicked;

   @override
  BoardState reduceBoardState() {
    dispatch(WaitVictoryAndShowDialogAction());
    dispatch(PlaceBombsAction(indexClicked));
    dispatch(PlaceNumbersAction());
    dispatch(StartStopwatchAction());
    return boardState.copy(
      gameProgress: GameProgress.inProgress
    );
  }

  @override
  void after() {
     dispatch(UpdateTilesContent());
     dispatch(UpdateGameProgress());
  }


}
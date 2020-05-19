import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';


// Essa ação é disparada quando o usuário clica na sua primeira casa
class InitializeBoardAction extends ReduxAction<GameState> {
  InitializeBoardAction(this.indexClicked);
  final int indexClicked;

   @override
  GameState reduce() {
    dispatch(WaitVictoryAndShowDialogAction());
    dispatch(PlaceBombsAction(indexClicked));
    dispatch(PlaceNumbersAction());
    dispatch(StartStopwatchAction());
    return state.copy(
      gameProgress: GameProgress.inProgress
    );
  }


}
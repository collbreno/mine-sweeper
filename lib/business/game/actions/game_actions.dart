import 'package:async_redux/async_redux.dart';
import '../models/game_state.dart';

class IncrementAction extends ReduxAction<GameState> {
  IncrementAction();
  
  GameState reduce() {
    int newCount = state.count +1;
    dispatch(SetTextAction(newCount));
    return state.copy(count: newCount);
  }
}

class SetTextAction extends ReduxAction<GameState> {
  final int count;
  SetTextAction(this.count);

  GameState reduce(){
    return state.copy(title: count.isEven ? 'O número é par' : 'O número é impar');
  }
}
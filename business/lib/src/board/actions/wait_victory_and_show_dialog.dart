import 'package:business/business.dart';

class WaitVictoryAndShowDialogAction extends BoardAction {
@override
  Future<BoardState> reduceBoardState() async {
    await store.waitCondition((state) => tilesToDiscover <= 0 );
    dispatch(ShowDialogAction(DialogType.victory));
    StopwatchService().stop();
    return null;
  }

  @override
  void after() => dispatch(UpdateGameProgressAction());

}
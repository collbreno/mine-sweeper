import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';
import 'package:business/src/app/models/models.dart';

abstract class BaseAction extends ReduxAction<AppState> {
  // getters for all AppState properties
  BoardState get boardState => state.boardState;
  CloudState get cloudState => state.cloudState;

  // getters for all BoardState properties
  int get horizontalTiles => boardState.horizontalTiles;
  int get verticalTiles => boardState.verticalTiles;
  int get numberOfBombs => boardState.numberOfBombs;
  int get tilesToDiscover => boardState.tilesToDiscover;
  GameProgress get gameProgress => boardState.gameProgress;
  List<Tile> get tiles => boardState.tiles;
  Event<DialogType> get showDialogEvt => boardState.showDialogEvt;
  Duration get timeElapsed => boardState.timeElapsed;

  // getters for all CloudState properties
  bool get isRemote => cloudState.isRemote;
  AsyncData<String> get shareCode => cloudState.shareCode;
}

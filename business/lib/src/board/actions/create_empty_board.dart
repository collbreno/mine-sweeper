import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';


// Essa ação é disparada quando o usuário clica em Novo Jogo
class CreateEmptyBoardAction extends BoardAction {
  CreateEmptyBoardAction(this.difficulty);
  // CreateEmptyBoardAction({this.numberOfBombs, this.horizontalTiles, this.verticalTiles});
  final Difficulty difficulty;

  @override
  BoardState reduceBoardState() {
    var tiles = _createEmptyTiles();
    StopwatchService().stopAndReset();
    dispatch(NewLocalGameAction());
    return boardState.copy(
      horizontalTiles: getHorizontalTiles(),
      numberOfBombs: getNumberOfBombs(),
      verticalTiles: getVerticalTiles(), 
      tilesToDiscover: getVerticalTiles() * getHorizontalTiles() - getNumberOfBombs(),
      tiles: tiles,
      gameProgress: GameProgress.created,
    );
  }

  @override
  void after() => dispatch(UpdateGameProgressAction());

  List<Tile> _createEmptyTiles(){
    return List<Tile>.generate(getVerticalTiles()*getHorizontalTiles(), (index) => Tile(content: TileContent.empty, state: TileState.none));
  }

  int getNumberOfBombs() {
    var map = <Difficulty, int>{};
    map[Difficulty.easy] = 3;
    map[Difficulty.normal] = 27;
    map[Difficulty.hard] = 36;
    return map[difficulty];
  }

  int getVerticalTiles() {
    var map = <Difficulty, int>{};
    map[Difficulty.easy] = 10;
    map[Difficulty.normal] = 15;
    map[Difficulty.hard] = 20;
    return map[difficulty];
  }

  int getHorizontalTiles() {
    var map = <Difficulty, int>{};
    map[Difficulty.easy] = 6;
    map[Difficulty.normal] = 10;
    map[Difficulty.hard] = 15;
    return map[difficulty];
  }

}
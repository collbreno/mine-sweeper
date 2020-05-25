import 'package:business/business.dart';


// Essa ação é disparada quando o usuário clica em Novo Jogo
class CreateEmptyBoardAction extends BoardAction {
  CreateEmptyBoardAction(this.difficulty);
  // CreateEmptyBoardAction({this.numberOfBombs, this.horizontalTiles, this.verticalTiles});
  final Difficulty difficulty;
  BoardSize _boardSize;

  @override
  BoardState reduceBoardState() {
    _boardSize = BoardSize.of(difficulty);
    var tiles = _createEmptyTiles();
    dispatch(ResetTimeElapsedAction());
    dispatch(NewLocalGameAction());
    return boardState.copy(
      boardSize: _boardSize,
      numberOfBombs: _getNumberOfBombs(),
      tilesToDiscover: _boardSize.total - _getNumberOfBombs(),
      tiles: tiles,
      gameProgress: GameProgress.created,
    );
  }

  @override
  void after() => dispatch(UpdateGameProgressAction());

  List<Tile> _createEmptyTiles(){
    return List<Tile>.generate(_boardSize.total, (index) => Tile(content: TileContent.empty, state: TileState.none));
  }


  int _getNumberOfBombs() {
    var map = <Difficulty, int>{};
    map[Difficulty.easy] = 18;
    map[Difficulty.normal] = 27;
    map[Difficulty.hard] = 36;
    return map[difficulty];
  }


}
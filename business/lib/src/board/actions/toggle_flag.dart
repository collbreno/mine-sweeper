import 'package:business/business.dart';


// Essa ação é disparada quando o usuário clica e pressiona em alguma casa
class ToggleFlagAction extends BoardAction {
  ToggleFlagAction(this.index);

  final int index;

  @override
  BoardState reduceBoardState() {
    if (gameProgress != GameProgress.inProgress) return null;
    var newTiles = tiles;
    var tileClicked = newTiles.elementAt(index);
    var isAlreadyMarked = tileClicked.state == TileState.flag;
    if (!isAlreadyMarked && numberOfBombs <= 0) return null;
    var newTile = Tile(content: tileClicked.content, state: isAlreadyMarked ? TileState.none : TileState.flag);
    newTiles.replaceRange(index, index+1, [newTile]);
    return boardState.copy(
      tiles: newTiles,
      numberOfBombs: numberOfBombs + (isAlreadyMarked ? 1 : -1)
    );
  }

  @override
  void after() {
    dispatch(UpdateTilesStateAction());
    dispatch(UpdateNumberOfBombsAction());
  }
}
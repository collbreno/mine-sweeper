import 'package:async_redux/async_redux.dart';
import 'package:mine_sweeper/business/game/actions/discover_tile.dart';
import 'package:mine_sweeper/business/game/actions/discover_tiles_recursively.dart';
import 'package:mine_sweeper/business/game/actions/explode_bombs.dart';
import 'package:mine_sweeper/business/game/actions/positionate_bombs.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';
import 'package:mine_sweeper/business/game/models/tile.dart';


// Essa ação é disparada quando o usuário clica em uma casa qualquer
class MakeAMoveAction extends ReduxAction<GameState> {
  MakeAMoveAction(this.index);

  final int index;

  @override
  GameState reduce() {
    if (!state.initializated) dispatch(PositionateBombsAction(index));
    var tileContent = state.tiles.elementAt(index).content;
    if (tileContent == TileContent.bomb){
      dispatch(ExplodeBombsAction(index));
    }
    else if (tileContent == TileContent.empty){
      dispatch(DiscoverTilesRecursivelyAction(index));
    }
    else {
      dispatch(DiscoverTileAction(index));
    }
    return null;
  }

}
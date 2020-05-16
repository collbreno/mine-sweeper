import 'package:flutter/material.dart';
import 'package:mine_sweeper/business/game/models/game_progress.dart';
import 'package:mine_sweeper/business/game/models/tile.dart';
import 'package:mine_sweeper/screens/game/components/tiles/empty_tile.dart';
import 'package:mine_sweeper/screens/game/tile_specs.dart';
import 'package:mine_sweeper/screens/game/components/tiles/bomb.dart';
import 'package:mine_sweeper/screens/game/components/tiles/exploded_bomb.dart';
import 'package:mine_sweeper/screens/game/components/tiles/flag.dart';
import 'package:mine_sweeper/screens/game/components/tiles/mistaken_flag.dart';
import 'package:mine_sweeper/screens/game/components/tiles/numbered_tile.dart';
import 'package:mine_sweeper/screens/game/components/tiles/undiscovered_tile.dart';

class TileSquare extends StatelessWidget {

  final Color emptyBackgroundColor = Colors.blue[50];
  final Color emptyHighLightColor = Colors.blue[100];
  final Color emptySplashColor = Colors.blue[200];
  final Color buttonBackgroundColor = Colors.blueAccent;
  final Color buttonHighLightColor = Colors.blue[800];
  final Color buttonSplashColor = Colors.blue[900];
  final Color bombBackgroundColor = Colors.red[800];
  final Color borderColor = Colors.blue[300];
  final double buttonElevation = 2;

  @override
  Widget build(BuildContext context) {
    var gameProgress = TileSpecs.of(context).gameProgress;
    var tile = TileSpecs.of(context).tile;

    if (gameProgress == GameProgress.created || gameProgress == GameProgress.inProgress){
      if (tile.state == TileState.none) {
        return UndiscoveredTile();
      }
      else if (tile.state == TileState.discovered) {
        return checkContentAndReturn(false, context);
      }
      else if (tile.state == TileState.flag) {
        return Flag();
      }
    }
    else if (gameProgress == GameProgress.user_won) {
      return checkContentAndReturn(true, context);
    }
    else if (gameProgress == GameProgress.user_lost) {
      if (tile.state == TileState.none) {
        if (tile.content == TileContent.bomb) {
          return Bomb();
        }
        else {
          return UndiscoveredTile();
        }
      }
      if (tile.state == TileState.discovered) {
        return checkContentAndReturn(false, context);
      }
      else if (tile.state == TileState.flag) {
        if (tile.content == TileContent.bomb) {
          return Flag();
        }
        else {
          return MistakenFlag();
        }
      }
    }
    return UndiscoveredTile();
  }

  Widget checkContentAndReturn(bool showFlag, BuildContext context){
    switch (TileSpecs.of(context).tile.content) {
      case TileContent.bomb:
        return showFlag ? Flag() : ExplodedBomb(); 
      case TileContent.empty:
        return EmptyTile();
      default:
        return NumberedTile();
    }
  }

}
import 'package:flutter/material.dart';
import 'package:mine_sweeper/business/game/models/game_progress.dart';
import 'package:mine_sweeper/business/game/models/tile.dart';

class TileSpecs extends InheritedWidget {
  
  TileSpecs({
    @required this.tile, 
    @required this.onPress, 
    @required this.onLongPress, 
    @required this.gameProgress, 
    @required Widget child,
  }) : super(child: child);

  final Tile tile;
  final void Function() onPress;
  final void Function() onLongPress;
  final GameProgress gameProgress;

  static TileSpecs of (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TileSpecs>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
  
}
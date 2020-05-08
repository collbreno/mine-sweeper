import 'package:flutter/material.dart';
import 'package:mine_sweeper/business/game/models/tile.dart';
import 'package:mine_sweeper/screens/game/tile_widget.dart';

class Game extends StatelessWidget {
  Game({ 
    @required this.verticalTiles, 
    @required this.horizontalTiles, 
    @required this.numberOfBombs,
    @required this.tiles,
    @required this.makeAMove,
    @required this.toggleFlag
  });

  final int verticalTiles;
  final int horizontalTiles;
  final int numberOfBombs;
  final List<Tile> tiles;
  final void Function(int) toggleFlag;
  final void Function(int) makeAMove;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Game"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: GridView.builder(
              itemCount: this.tiles.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: horizontalTiles),
              itemBuilder: (context, index){
                return TileSquare(
                  onPress: () => makeAMove(index),
                  onLongPress: () => toggleFlag(index),
                  tile: tiles.elementAt(index),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
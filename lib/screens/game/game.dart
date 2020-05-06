import 'package:flutter/material.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';
import 'package:mine_sweeper/screens/game/tile_widget.dart';

class Game extends StatelessWidget {
  Game({ 
    @required this.verticalTiles, 
    @required this.horizontalTiles, 
    @required this.numberOfBombs,
    @required this.tiles,
    @required this.discoverTile
  });

  final int verticalTiles;
  final int horizontalTiles;
  final int numberOfBombs;
  final List<Tile> tiles;
  final void Function(int) discoverTile;

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
                  onPress: () => discoverTile(index),
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
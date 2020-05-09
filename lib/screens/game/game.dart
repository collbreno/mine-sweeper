import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:mine_sweeper/business/game/models/tile.dart';
import 'package:mine_sweeper/screens/game/tile_widget.dart';
import 'package:mine_sweeper/screens/game/victory_dialog.dart';

class Game extends StatefulWidget {
  Game({ 
    @required this.verticalTiles, 
    @required this.horizontalTiles, 
    @required this.numberOfBombs,
    @required this.tiles,
    @required this.makeAMove,
    @required this.toggleFlag,
    @required this.newGame,
    @required this.showVictoryDialogEvt,
  });

  final int verticalTiles;
  final int horizontalTiles;
  final int numberOfBombs;
  final List<Tile> tiles;
  final void Function(int) toggleFlag;
  final void Function(int) makeAMove;
  final void Function() newGame;
  final Event showVictoryDialogEvt;

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  @override
  void didUpdateWidget(Game oldWidget) {
    super.didUpdateWidget(oldWidget);
    consumeEvents();
  }

  void consumeEvents() {
    if (widget.showVictoryDialogEvt.consume()) {
      WidgetsBinding.instance.addPostFrameCallback((_){
        showDialog(
          context: context,
          builder: (context){
            return VictoryDialog(
              newGame: widget.newGame,
            );
          }
        );
      });
    }
  }

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
              itemCount: this.widget.tiles.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: widget.horizontalTiles),
              itemBuilder: (context, index){
                return TileSquare(
                  onPress: () => widget.makeAMove(index),
                  onLongPress: () => widget.toggleFlag(index),
                  tile: widget.tiles.elementAt(index),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
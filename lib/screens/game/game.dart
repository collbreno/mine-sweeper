import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:mine_sweeper/business/game/models/game_progress.dart';
import 'package:mine_sweeper/business/game/models/tile.dart';
import 'package:mine_sweeper/screens/game/components/app_bar_item.dart';
import 'package:mine_sweeper/screens/game/components/defeat_dialog.dart';
import 'package:mine_sweeper/screens/game/components/tile_widget.dart';
import 'package:mine_sweeper/screens/game/components/victory_dialog.dart';
import 'package:mine_sweeper/screens/game/tile_specs.dart';

class Game extends StatefulWidget {
  Game({ 
    @required this.verticalTiles, 
    @required this.horizontalTiles, 
    @required this.numberOfBombs,
    @required this.tiles,
    @required this.makeAMove,
    @required this.toggleFlag,
    @required this.newGame,
    @required this.showDialogEvt,
    @required this.gameProgress,
    @required this.secondsElapsed
  });

  final int verticalTiles;
  final int horizontalTiles;
  final int numberOfBombs;
  final List<Tile> tiles;
  final void Function(int) toggleFlag;
  final void Function(int) makeAMove;
  final void Function() newGame;
  final GameProgress gameProgress;
  final Event<DialogType> showDialogEvt;
  final int secondsElapsed;

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
    var payload = widget.showDialogEvt.consume();
    if (payload != null) {
      WidgetsBinding.instance.addPostFrameCallback((_){
        showDialog(
          context: context,
          builder: (context){
            if (payload == DialogType.defeat)
              return DefeatDialog(newGame: widget.newGame,);
            return VictoryDialog(
              seconds: widget.secondsElapsed,
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AppBarItem(imagePath: 'assets/images/bomb.png', text: ": ${widget.numberOfBombs}",),
            Padding(
              padding: EdgeInsets.only(right: 50),
              child: AppBarItem(imagePath: 'assets/images/timer.png', text: ": ${widget.secondsElapsed}s",),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: GridView.builder(
              itemCount: this.widget.tiles.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: widget.horizontalTiles),
              itemBuilder: (context, index){
                return TileSpecs(
                  onPress: handlePress(index),
                  onLongPress: handleLongPress(index),
                  tile: widget.tiles.elementAt(index),
                  gameProgress: widget.gameProgress,
                  child: TileSquare(),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  
  void Function() handlePress(int index){
    if (widget.gameProgress == GameProgress.user_lost || widget.gameProgress == GameProgress.user_won) return null;
    return () => widget.makeAMove(index);
  }

  void Function() handleLongPress(int index){
    if (widget.gameProgress != GameProgress.inProgress) return null;
    return () => widget.toggleFlag(index);
  }
}
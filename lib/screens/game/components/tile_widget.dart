import 'package:flutter/material.dart';
import 'package:mine_sweeper/business/game/models/game_progress.dart';
import 'package:mine_sweeper/business/game/models/tile.dart';

class TileSquare extends StatelessWidget {
  TileSquare({@required this.onPress, @required this.onLongPress, @required this.tile, @required this.gameProgress});

  final void Function() onPress;
  final void Function() onLongPress;
  final Tile tile;
  final GameProgress gameProgress;
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
    if (gameProgress == GameProgress.created || gameProgress == GameProgress.inProgress){
      if (tile.state == TileState.none) {
        return renderButton();
      }
      else if (tile.state == TileState.discovered) {
        return checkContentAndReturn(false);
      }
      else if (tile.state == TileState.flag) {
        return renderFlag();
      }
    }
    else if (gameProgress == GameProgress.user_won) {
      return checkContentAndReturn(true);
    }
    else if (gameProgress == GameProgress.user_lost) {
      if (tile.state == TileState.none) {
        if (tile.content == TileContent.bomb) {
          return renderBomb();
        }
        else {
          return renderButton();
        }
      }
      if (tile.state == TileState.discovered) {
        return checkContentAndReturn(false);
      }
      else if (tile.state == TileState.flag) {
        if (tile.content == TileContent.bomb) {
          return renderFlag();
        }
        else {
          return renderMistakenFlag();
        }
      }
    }
    return renderButton();
  }

  void Function() handlePress(){
    if (gameProgress == GameProgress.user_lost || gameProgress == GameProgress.user_won) return null;
    return onPress;
  }

  void Function() handleLongPress(){
    if (gameProgress != GameProgress.inProgress) return null;
    return onLongPress;
  }

  Widget checkContentAndReturn(bool showFlag){
    switch (tile.content) {
      case TileContent.bomb:
        return showFlag ? renderFlag() : renderExplodedBomb(); 
      case TileContent.empty:
        return renderEmpty();
      default:
        return renderNumber();
    }
  }

  Widget renderButton(){
    return Material(
      elevation: buttonElevation,
      color: buttonBackgroundColor,
      child: InkWell(
        onTap: handlePress(),
        onLongPress: handleLongPress(),
        highlightColor: buttonHighLightColor,
        splashColor: buttonSplashColor,
      ),
    );
  }

  Widget renderMistakenFlag() {
    return Material(
      color: buttonBackgroundColor,
      elevation: buttonElevation,
      child: InkWell(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Icon(Icons.flag, color: Colors.red[800],),
            Icon(Icons.close),
          ],
        ),
        highlightColor: buttonHighLightColor,
        splashColor: buttonSplashColor,
        onTap: handlePress(),
        onLongPress: handleLongPress(),
      ),
    );
  }

  Widget renderFlag(){
    return Material(
      color: buttonBackgroundColor,
      elevation: buttonElevation,
      child: InkWell(
        child: Icon(Icons.flag, color: Colors.red[800],),
        highlightColor: buttonHighLightColor,
        splashColor: buttonSplashColor,
        onTap: handlePress(),
        onLongPress: handleLongPress(),
      ),
    );
  }

  Widget renderExplodedBomb() {
    return Material(
      color: bombBackgroundColor,
      child: Padding(
        padding: EdgeInsets.all(6.0),
        child: Center(child: Image.asset('assets/images/bomb_black.png')),
      ),
      shape: BeveledRectangleBorder(side: BorderSide(width: 0.1, color: borderColor)),
    );
  }

  Widget renderBomb(){
    return Material(
      color: emptyBackgroundColor,
      child: Padding(
        padding: EdgeInsets.all(6.0),
        child: Center(child: Image.asset('assets/images/bomb_black.png')),
      ),
      shape: BeveledRectangleBorder(side: BorderSide(width: 0.1, color: borderColor)),
    );
  }

  Widget renderEmpty() {
    return Material(
      color: emptyBackgroundColor,
      shape: BeveledRectangleBorder(side: BorderSide(width: 0.1, color: borderColor)),
    );
  }

  Widget renderNumber() {
    return Material(
      shape: BeveledRectangleBorder(side: BorderSide(width: 0.1, color: borderColor)),
      color: emptyBackgroundColor,
      child: InkWell(
        onTap: handlePress(),
        highlightColor: emptyHighLightColor,
        splashColor: emptySplashColor,
        child: Center(
          child: Text(
            tile.content.index.toString(), 
            style: TextStyle(
              fontWeight: FontWeight.w500, 
              fontFamily: 'RussoOne',
              fontSize: 16,
              color: getNumberColor(tile.content.index)
            ),
          ),
        ),
      ),
    );
  }

  Color getNumberColor(int number) {
    Map<int,Color> colors = Map<int,Color>();
    colors[1] = Colors.indigoAccent[700];
    colors[2] = Colors.green[700];
    colors[3] = Colors.red[700];
    colors[4] = Colors.blue[900];
    colors[5] = Colors.brown[600];
    colors[6] = Colors.cyan;
    colors[7] = Colors.black;
    colors[8] = Colors.grey;
    colors[9] = Colors.orange[900];
    return colors[number];
  }

}
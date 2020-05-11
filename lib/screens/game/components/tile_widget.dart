import 'package:flutter/material.dart';
import 'package:mine_sweeper/business/game/models/tile.dart';

class TileSquare extends StatelessWidget {
  TileSquare({@required this.onPress, @required this.onLongPress, @required this.tile});

  final void Function() onPress;
  final void Function() onLongPress;
  final Tile tile;
  final Color backgroundColor = Colors.blue[50];
  final Color bombBackgroundColor = Colors.red[900];
  final Color buttonBackgroundColor = Colors.blueAccent;
  final Color borderColor = Colors.blue[300];

  @override
  Widget build(BuildContext context) {
    switch (tile.state) {
      case TileState.none:
        return renderButton();
      case TileState.flag:
        return renderFlagButton();
      case TileState.discovered:
        return checkContentAndReturn();
      default:
        return renderButton();
    }
  }

  Widget renderButton(){
    return RaisedButton(
      shape: BeveledRectangleBorder(),
      color: buttonBackgroundColor,
      onPressed: onPress,
      onLongPress: onLongPress,
    );
  }

  Widget renderFlagButton(){
    return RaisedButton(
      shape: BeveledRectangleBorder(),
      color: buttonBackgroundColor,
      padding: EdgeInsets.all(0),
      child: Icon(Icons.flag, color: Colors.red[800],),
      onPressed: onPress,
      onLongPress: onLongPress,
    );
  }

  Widget checkContentAndReturn(){
    switch (tile.content) {
      case TileContent.bomb:
        return renderBomb(); 
      case TileContent.empty:
        return renderEmpty();
      default:
        return renderNumber();
    }
  }

  Widget renderBomb(){
    return Material(
      color: bombBackgroundColor,
      child: Padding(
        padding: EdgeInsets.all(6.0),
        child: Center(child: Image.asset('assets/images/bomb.png')),
      ),
      shape: BeveledRectangleBorder(side: BorderSide(width: 0.1, color: borderColor)),
    );
  }

  Widget renderEmpty() {
    return Material(
      color: backgroundColor,
      shape: BeveledRectangleBorder(side: BorderSide(width: 0.1, color: borderColor)),
    );
  }

  Widget renderNumber() {
    return Material(
      shape: BeveledRectangleBorder(side: BorderSide(width: 0.1, color: borderColor)),
      color: backgroundColor,
      child: InkWell(
        onTap: onPress,
        highlightColor: Colors.blue[100],
        splashColor: Colors.blue[200],
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
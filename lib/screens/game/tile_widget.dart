import 'package:flutter/material.dart';
import 'package:mine_sweeper/business/game/models/tile.dart';

class TileSquare extends StatelessWidget {
  TileSquare({@required this.onPress, @required this.onLongPress, @required this.tile});

  final void Function() onPress;
  final void Function() onLongPress;
  final Tile tile;

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
      color: Colors.blueAccent,
      onPressed: onPress,
      onLongPress: onLongPress,
    );
  }

  Widget renderFlagButton(){
    return RaisedButton(
      shape: BeveledRectangleBorder(),
      color: Colors.blueAccent,
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
    return Center(
      child: Icon(Icons.ac_unit),
    );
  }

  Widget renderEmpty() {
    return Container();
  }

  Widget renderNumber() {
    return InkWell(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        child: Text(tile.content.index.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }

}
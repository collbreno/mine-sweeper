import 'package:flutter/material.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';
import 'package:mine_sweeper/business/game/models/tile.dart';

class TileSquare extends StatelessWidget {
  TileSquare({@required this.onPress, @required this.tile});

  final void Function() onPress;
  final Tile tile;

  @override
  Widget build(BuildContext context) {
    switch (tile.state) {
      case TileState.none:
        return renderButton();
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
      onPressed: () => onPress(),
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
    return Container(
      alignment: Alignment.center,
      child: Text(tile.content.index.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
    );
  }

}
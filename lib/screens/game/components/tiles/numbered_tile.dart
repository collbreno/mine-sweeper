import 'package:flutter/material.dart';
import 'package:mine_sweeper/screens/game/tile_specs.dart';

class NumberedTile extends StatelessWidget {
  
  
  final Color emptyBackgroundColor = Colors.blue[50];
  final Color emptyHighLightColor = Colors.blue[100];
  final Color emptySplashColor = Colors.blue[200];
  final Color borderColor = Colors.blue[300];
  @override
  Widget build(BuildContext context) {
    var tileSpecs = TileSpecs.of(context);
    return Material(
      shape: BeveledRectangleBorder(side: BorderSide(width: 0.1, color: borderColor)),
      color: emptyBackgroundColor,
      child: InkWell(
        onTap: tileSpecs.onPress,
        highlightColor: emptyHighLightColor,
        splashColor: emptySplashColor,
        child: Center(
          child: Text(
            tileSpecs.tile.content.index.toString(), 
            style: TextStyle(
              fontWeight: FontWeight.w500, 
              fontFamily: 'RussoOne',
              fontSize: 16,
              color: getNumberColor(tileSpecs.tile.content.index)
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
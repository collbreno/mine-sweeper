import 'package:flutter/material.dart';
import 'package:client/screens/game/tile_specs.dart';

class UndiscoveredTile extends StatelessWidget {
  
  final Color buttonBackgroundColor = Colors.blueAccent;
  final Color buttonHighLightColor = Colors.blue[800];
  final Color buttonSplashColor = Colors.blue[900];
  final double buttonElevation = 2;

  @override
  Widget build(BuildContext context) {
    var tileSpecs = TileSpecs.of(context);
    return Material(
      elevation: buttonElevation,
      color: buttonBackgroundColor,
      child: InkWell(
        onTap: tileSpecs.onPress,
        onLongPress: tileSpecs.onLongPress,
        highlightColor: buttonHighLightColor,
        splashColor: buttonSplashColor,
      ),
    );
    
  }
}
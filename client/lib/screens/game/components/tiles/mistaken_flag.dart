import 'package:flutter/material.dart';

import '../../tile_specs.dart';

class MistakenFlag extends StatelessWidget {
  
  final Color buttonBackgroundColor = Colors.blueAccent;
  final Color buttonHighLightColor = Colors.blue[800];
  final Color buttonSplashColor = Colors.blue[900];
  final double buttonElevation = 2;
  @override
  Widget build(BuildContext context) {
    var tileSpecs = TileSpecs.of(context);
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
        onTap: tileSpecs.onPress,
        onLongPress: tileSpecs.onLongPress,
      ),
    );
  }
}
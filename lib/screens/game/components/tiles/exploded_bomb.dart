import 'package:flutter/material.dart';

class ExplodedBomb extends StatelessWidget {
  
  final Color bombBackgroundColor = Colors.red[800];
  final Color borderColor = Colors.blue[300];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bombBackgroundColor,
      child: Padding(
        padding: EdgeInsets.all(6.0),
        child: Center(child: Image.asset('assets/images/bomb_black.png')),
      ),
      shape: BeveledRectangleBorder(side: BorderSide(width: 0.1, color: borderColor)),
    );
  }
}
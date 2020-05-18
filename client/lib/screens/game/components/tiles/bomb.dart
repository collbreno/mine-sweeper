import 'package:flutter/material.dart';

class Bomb extends StatelessWidget {
  
  final Color emptyBackgroundColor = Colors.blue[50];
  final Color borderColor = Colors.blue[300];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: emptyBackgroundColor,
      child: Padding(
        padding: EdgeInsets.all(6.0),
        child: Center(child: Image.asset('assets/images/bomb_black.png')),
      ),
      shape: BeveledRectangleBorder(side: BorderSide(width: 0.1, color: borderColor)),
    );
  }
}
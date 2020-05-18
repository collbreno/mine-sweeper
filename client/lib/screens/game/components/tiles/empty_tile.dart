import 'package:flutter/material.dart';

class EmptyTile extends StatelessWidget {
  
  final Color emptyBackgroundColor = Colors.blue[50];
  final Color borderColor = Colors.blue[300];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: emptyBackgroundColor,
      shape: BeveledRectangleBorder(side: BorderSide(width: 0.1, color: borderColor)),
    );
  }
}
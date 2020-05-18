import 'package:flutter/material.dart';

class AppBarItem extends StatelessWidget {
  final String imagePath;
  final String text;

  AppBarItem({@required this.imagePath, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset(imagePath, width: 28, height: 28,),
        Text(text)
      ],
    );
  }
}
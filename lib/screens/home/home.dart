import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({@required this.count, @required this.text, @required this.onFabPress, });

  final String text;
  final int count;
  final void Function() onFabPress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(text),
            Text("O botão foi pressionado $count vezes")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: onFabPress,
      ),
    );
  }
}
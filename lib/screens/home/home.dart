import 'package:flutter/material.dart';
import 'package:mine_sweeper/screens/game/game_connector.dart';

class Home extends StatelessWidget {
  Home({@required this.initGameBoard });

  final void Function() initGameBoard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Jogar".toUpperCase()),
          onPressed: () {
            initGameBoard();
            Navigator.push(context, MaterialPageRoute(builder: (context) => GameConnector()));
          },
        ),
      ),
    );
  }
}
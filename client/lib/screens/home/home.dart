import 'package:business/business.dart';
import 'package:client/screens/game/game_connector.dart';
import 'package:flutter/material.dart';

import 'components/play_button.dart';

class Home extends StatelessWidget {
  Home({@required this.initGameBoard });

  final void Function(Difficulty) initGameBoard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: PlayButton(
          onDifficultySelected: (d) => onDifficultySelected(d, context)
        ),
        // child: RaisedButton(
        //   child: Text("Jogar".toUpperCase()),
        //   onPressed: () {
        //     initGameBoard();
        //     Navigator.push(context, MaterialPageRoute(builder: (context) => GameConnector()));
        //   },
        // ),
      ),
    );
  }

  void onDifficultySelected(Difficulty d, context) {
      initGameBoard(d);
      Navigator.push(context, MaterialPageRoute(builder: (context) => GameConnector()));
  }


}
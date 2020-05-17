import 'package:flutter/material.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';
import 'package:mine_sweeper/screens/game/game_connector.dart';
import 'package:mine_sweeper/screens/home/components/play_button.dart';

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
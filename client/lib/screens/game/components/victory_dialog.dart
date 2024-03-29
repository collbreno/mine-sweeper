import 'package:flutter/material.dart';

class VictoryDialog extends StatelessWidget {
  VictoryDialog({@required this.newGame, @required this.seconds});

  final int seconds;
  final void Function() newGame;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: <Widget>[
          Text("Parabéns!"),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Image(
              image: AssetImage('assets/images/cup.png'),
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      content: Text("Você venceu com um tempo de $seconds segundos."), //TODO: inserir tempo,
      actions: <Widget>[
        FlatButton(
          child: Text("Sair".toUpperCase()),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text("Reiniciar".toUpperCase()),
          onPressed: () {
            newGame();
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
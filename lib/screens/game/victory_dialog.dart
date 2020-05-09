import 'package:flutter/material.dart';

class VictoryDialog extends StatelessWidget {
  VictoryDialog({@required this.newGame});

  final void Function() newGame;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Parabéns"),
      content: Text("Você venceu com um tempo de ..."), //TODO: inserir tempo,
      actions: <Widget>[
        FlatButton(
          child: Text("Sair".toUpperCase()),
          onPressed: () => Navigator.pop(context),
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
import 'package:flutter/material.dart';

class DefeatDialog extends StatelessWidget {
  DefeatDialog({@required this.newGame});

  final void Function() newGame;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: <Widget>[
          Text("Boom!"),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Image(
              image: AssetImage('assets/images/bomb_black.png'),
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      content: Text("Você perdeu. Tente novamente!"), //TODO: inserir tempo,
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
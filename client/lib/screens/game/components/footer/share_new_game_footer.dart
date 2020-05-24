import 'package:client/screens/game/components/footer/footer.dart';
import 'package:client/screens/game/components/footer/footer_box.dart';
import 'package:flutter/material.dart';

class ShareNewGameFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var footerScope = FooterScope.of(context);
    return FooterBox(
      onTap: footerScope.onShareNewGame,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "Compartilhe seu jogo",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Container(
            width: 24,
          ),
          Icon(
            Icons.share,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

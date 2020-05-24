import 'package:client/screens/game/components/footer/footer.dart';
import 'package:client/screens/game/components/footer/footer_box.dart';
import 'package:flutter/material.dart';

class TryAgainFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var footerScope = FooterScope.of(context);
    return FooterBox(
      onTap: footerScope.onShareNewGame,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.warning,
            color: Colors.white,
          ),
          Container(
            width: 12,
          ),
          Text(
            "Algo deu errado.\nTente novamente.",
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          Container(
            width: 24,
          ),
          Icon(
            Icons.refresh,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

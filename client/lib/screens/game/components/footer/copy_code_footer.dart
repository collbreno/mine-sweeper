import 'package:client/screens/game/components/footer/footer.dart';
import 'package:client/screens/game/components/footer/footer_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyCodeFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var footerScope = FooterScope.of(context);
    return FooterBox(
      onTap: () =>
          Clipboard.setData(ClipboardData(text: footerScope.shareCode.data)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            footerScope.shareCode.data,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Container(
            width: 24,
          ),
          Icon(
            Icons.content_copy,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

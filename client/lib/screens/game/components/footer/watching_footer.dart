import 'package:client/screens/game/components/footer/footer.dart';
import 'package:flutter/material.dart';

import 'footer_box.dart';

class WatchingFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var footerScope = FooterScope.of(context);
    return FooterBox(
      child:  Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(footerScope.shareCode.data ?? '', style: TextStyle(fontSize: 14, color: Colors.white),),
          Icon(Icons.remove_red_eye, color: Colors.white,),
        ],
      ),
    );
  }
}

import 'package:client/screens/game/components/footer/footer.dart';
import 'package:flutter/material.dart';

class FooterBox extends StatelessWidget {
  FooterBox({@required this.child, this.onTap,});

  final Widget child;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    var footerScope = FooterScope.of(context);
    return Material(
      color: Colors.grey[800],
      shape: RoundedRectangleBorder(side: BorderSide(width: 0.2, color: Colors.white), borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          height: footerScope.height*(2/3),
          child: child
        ),
      ),
    );
  }
}

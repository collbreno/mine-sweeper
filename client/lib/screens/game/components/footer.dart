import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  Footer({@required this.child, this.onTap, @required this.height});

  final Widget child;
  final void Function() onTap;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[800],
      shape: RoundedRectangleBorder(side: BorderSide(width: 0.2, color: Colors.white), borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          height: height,
          child: child
        ),
      ),
    );
  }
}

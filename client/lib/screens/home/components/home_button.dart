import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  HomeButton({
    @required this.title,
    @required this.onTap,
    this.roundBottomBorder = false,
    this.roundTopBorder = false,
    this.trailing,
    this.leading,
  });

  final String title;
  final void Function() onTap;
  final bool roundBottomBorder;
  final bool roundTopBorder;
  final Widget trailing;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(roundTopBorder ? 4 : 0),
            bottom: Radius.circular(roundBottomBorder ? 4 : 0)),
      ),
      child: InkWell(
        child: Container(
          alignment: Alignment.center,
          height: 42,
          width: 230,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: getStackChildren(),
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  List<Widget> getStackChildren() {
    var list = List<Widget>();
    if (trailing != null) {
      list.add(renderTrailing());
    }
    if (leading != null) {
      list.add(renderLeading());
    }
    list.add(renderTitle());
    return list;
  }

  Widget renderTitle() {
    return Center(
      child: Text(
        title.toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget renderTrailing() {
    return Positioned(
      right: 20,
      child: trailing,
    );
  }

  Widget renderLeading() {
    return Positioned(
      left: 20,
      child: leading,
    );
  }
}

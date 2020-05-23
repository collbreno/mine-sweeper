import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:business/business.dart';
import 'package:client/screens/home/components/home_button.dart';
import 'package:flutter/material.dart';

class PlayButton extends StatefulWidget {
  PlayButton({this.onDifficultySelected});

  final void Function(Difficulty) onDifficultySelected;

  @override
  _PlayButtonState createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  bool collapsed = true;

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(backButtonInterceptor, zIndex: 1);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(backButtonInterceptor);
    super.dispose();
  }

  bool backButtonInterceptor(bool stopDefaultButtonEvent) {
    if (collapsed || stopDefaultButtonEvent) return false;
    setState(() {
      collapsed = true;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      crossFadeState:
          collapsed ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      secondChild: second(),
      firstChild: first(),
      duration: Duration(milliseconds: 300),
    );
  }

  Widget renderContent() {
    if (collapsed) {
      return first();
    }
    return second();
  }

  Widget first() {
    return HomeButton(
      onTap: toggleCollapsed,
      title: 'Jogar',
      leading: Icon(
        Icons.play_arrow,
        color: Colors.white,
      ),
      roundTopBorder: true,
      roundBottomBorder: true,
    );
  }

  Widget second() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        HomeButton(
          onTap: () {
            toggleCollapsed();
            widget.onDifficultySelected(Difficulty.easy);
          },
          title: 'Fácil',
          trailing: Text(
            "8x12",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          roundTopBorder: true,
        ),
        Container(
          height: 0.2,
        ),
        HomeButton(
          onTap: () {
            toggleCollapsed();
            widget.onDifficultySelected(Difficulty.normal);
          },
          trailing: Text(
            "10x15",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          title: 'Médio',
        ),
        Container(
          height: 0.2,
        ),
        HomeButton(
          onTap: () {
            toggleCollapsed();
            widget.onDifficultySelected(Difficulty.hard);
          },
          trailing: Text(
            "15x20",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          title: 'Difícil',
          roundBottomBorder: true,
        ),
      ],
    );
  }

  void toggleCollapsed() {
    setState(() {
      collapsed = !collapsed;
    });
  }
}

import 'package:business/business.dart';
import 'package:client/screens/home/components/home_button.dart';
import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  PlayButton({
    this.onDifficultySelected,
    this.collapsed,
    this.onExpand,
  });

  final void Function(Difficulty) onDifficultySelected;
  final void Function() onExpand;
  final bool collapsed;
  
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
      onTap: onExpand,
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
            onDifficultySelected(Difficulty.easy);
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
            onDifficultySelected(Difficulty.normal);
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
            onDifficultySelected(Difficulty.hard);
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

  
  
}

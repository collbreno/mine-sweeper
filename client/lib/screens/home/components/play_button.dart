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
          title: _getButtonText(Difficulty.easy),
          trailing: Text(
            _getButtonTrailingText(Difficulty.easy),
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
            _getButtonTrailingText(Difficulty.normal),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          title: _getButtonText(Difficulty.normal),
        ),
        Container(
          height: 0.2,
        ),
        HomeButton(
          onTap: () {
            onDifficultySelected(Difficulty.hard);
          },
          trailing: Text(
            _getButtonTrailingText(Difficulty.hard),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          title: _getButtonText(Difficulty.hard),
          roundBottomBorder: true,
        ),
      ],
    );
  }

  String _getButtonText(Difficulty difficulty) {
    var map = <Difficulty, String>{};
    map[Difficulty.easy] = 'Fácil';
    map[Difficulty.normal] = 'Normal';
    map[Difficulty.hard] = 'Difícil';
    return map[difficulty];
  }

  String _getButtonTrailingText(Difficulty difficulty) {
    var size = BoardSize.of(difficulty);
    return "${size.width}x${size.height}";
  }

  
  
}

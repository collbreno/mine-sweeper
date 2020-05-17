import 'package:flutter/material.dart';
import 'package:mine_sweeper/business/game/models/game_state.dart';

class PlayButton extends StatefulWidget {
  PlayButton({this.onDifficultySelected});

  final void Function(Difficulty) onDifficultySelected;

  @override
  _PlayButtonState createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {

  bool collapsed = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      crossFadeState: collapsed ? CrossFadeState.showFirst : CrossFadeState.showSecond,
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
    return GameButton(
      onTap: toggleCollapsed, 
      title: 'Jogar',
      isTop: true,
      isBottom: true,
    );
  }

  Widget second() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GameButton(
          onTap: () => widget.onDifficultySelected(Difficulty.easy), 
          title: 'Fácil',
          isTop: true,
        ),
        GameButton(
          onTap: () => widget.onDifficultySelected(Difficulty.normal), 
          title: 'Médio',
        ),
        GameButton(
          onTap: () => widget.onDifficultySelected(Difficulty.hard), 
          title: 'Difícil',
          isBottom: true,
        ),
      ],
    );
  }

  void toggleCollapsed() {
    setState((){ 
      collapsed = !collapsed; 
    });
  }

}
class GameButton extends StatelessWidget {
  GameButton({this.title, this.onTap, this.isBottom = false, this.isTop = false});

  final String title;
  final void Function() onTap;
  final bool isBottom;
  final bool isTop;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(isTop ? 4 : 0), 
          bottom: Radius.circular(isBottom ? 4 : 0)
        ),
      ),
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: isTop? 0 : 0.2, color: Colors.white),
            )
          ),
          alignment: Alignment.center,
          height: 42,
          width: 200,
          child: Text(title.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),
        ),
        onTap: onTap,
      ),
    );
  }
}
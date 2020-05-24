import 'package:business/business.dart';
import 'package:client/screens/game/components/footer/copy_code_footer.dart';
import 'package:client/screens/game/components/footer/loading_footer.dart';
import 'package:client/screens/game/components/footer/share_new_game_footer.dart';
import 'package:client/screens/game/components/footer/try_again_footer.dart';
import 'package:client/screens/game/components/footer/watching_footer.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
   Footer({this.shareCode, this.onShareNewGame, this.isWatching, this.height});

  final AsyncData<String> shareCode;
  final void Function() onShareNewGame;
  final bool isWatching;
  final double height;


  @override
  Widget build(BuildContext context) {
    return FooterScope(
      onShareNewGame: onShareNewGame,
      shareCode: shareCode,
      child: renderChild(),
      height: height,
    );
  }

  Widget renderChild() {
    if (isWatching) {
      return WatchingFooter();
    }
    if (shareCode.isWaiting) {
      return LoadingFooter();
    }
    if (shareCode.hasError) {
      return TryAgainFooter();
    }
    if (shareCode.hasData) {
      return CopyCodeFooter();
    }
    return ShareNewGameFooter();
  }
}

class FooterScope extends InheritedWidget {
  FooterScope({
    @required this.shareCode,
    @required this.onShareNewGame,
    @required child,
    @required this.height,
  }) : super(child: child);

  final AsyncData<String> shareCode;
  final void Function() onShareNewGame;
  final double height;

  static FooterScope of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<FooterScope>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}

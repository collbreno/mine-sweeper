import 'package:async_redux/async_redux.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:business/business.dart';
import 'package:client/screens/game/game_connector.dart';
import 'package:client/screens/home/components/home_button.dart';
import 'package:client/screens/home/components/prompt_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/play_button.dart';

class Home extends StatefulWidget {
  Home({
    @required this.initGameBoard,
    @required this.isPromptDialogVisible,
    @required this.navigateEvt,
    @required this.showPromptDialog,
    @required this.checkIfIdExists,
    @required this.shareCode,
    @required this.dismissPromptDialog,
    @required this.isPlayButtonCollapsed,
    @required this.collapsePlayButton,
    @required this.expandPlayButton,
  });

  final void Function(Difficulty) initGameBoard;
  final bool isPromptDialogVisible;
  final bool isPlayButtonCollapsed;
  final Event navigateEvt;
  final void Function() showPromptDialog;
  final void Function() dismissPromptDialog;
  final void Function(String) checkIfIdExists;
  final AsyncData<String> shareCode;
  final void Function() collapsePlayButton;
  final void Function() expandPlayButton;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void didUpdateWidget(Home oldWidget) {
    super.didUpdateWidget(oldWidget);
    consumeEvents();
  }

  void consumeEvents() {
    if (widget.navigateEvt.consume()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => GameConnector()));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(dismissDialogOnBackButton, zIndex: 2);
    BackButtonInterceptor.add(collapsePlayButtonOnBackButton, zIndex: 1);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(dismissDialogOnBackButton);
    BackButtonInterceptor.remove(collapsePlayButtonOnBackButton);
    super.dispose();
  }

  bool dismissDialogOnBackButton(bool stopDefaultButtonEvent) {
    if (stopDefaultButtonEvent || !widget.isPromptDialogVisible) return false;
    widget.dismissPromptDialog();
    return true;
  }

  bool collapsePlayButtonOnBackButton(bool stopDefaultButtonEvent) {
    if (stopDefaultButtonEvent || widget.isPlayButtonCollapsed) return false;
    widget.collapsePlayButton();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                PlayButton(
                  onDifficultySelected: (d) => onDifficultySelected(d, context),
                  onExpand: widget.expandPlayButton,
                  collapsed: widget.isPlayButtonCollapsed,
                ),
                Container(
                  height: 20,
                ),
                HomeButton(
                  title: "Assistir",
                  leading: Icon(Icons.remove_red_eye, color: Colors.white,),
                  onTap: (){
                    widget.collapsePlayButton();
                    widget.showPromptDialog();
                  },
                  roundBottomBorder: true,
                  roundTopBorder: true,
                ),
              ],
            ),
          ),
          Visibility(
            visible: widget.isPromptDialogVisible,
            child: Stack(
              children: <Widget>[
                ModalBarrier(
                  color: Colors.black54,
                ),
                PromptDialog(
                  onSubmit: widget.checkIfIdExists,
                  shareCode: widget.shareCode,
                  onDismiss: widget.dismissPromptDialog,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onDifficultySelected(Difficulty d, context) {
    widget.collapsePlayButton();
    widget.initGameBoard(d);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => GameConnector()));
  }
}

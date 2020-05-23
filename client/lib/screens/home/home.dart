import 'package:async_redux/async_redux.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:business/business.dart';
import 'package:client/screens/game/game_connector.dart';
import 'package:client/screens/home/components/home_button.dart';
import 'package:client/screens/home/components/prompt_dialog.dart';
import 'package:client/screens/home/share_code_specs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/play_button.dart';

class Home extends StatefulWidget {
  Home({
    @required this.initGameBoard,
    @required this.promptDialogIsVisible,
    @required this.navigateEvt,
    @required this.showPromptDialog,
    @required this.checkIfIdExists,
    @required this.shareCode,
    @required this.dismissPromptDialog,
  });

  final void Function(Difficulty) initGameBoard;
  final bool promptDialogIsVisible;
  final Event navigateEvt;
  final void Function() showPromptDialog;
  final void Function() dismissPromptDialog;
  final void Function(String) checkIfIdExists;
  final AsyncData<String> shareCode;

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
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => GameConnector()));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(backButtonInterceptor, zIndex: 2);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(backButtonInterceptor);
    super.dispose();
  }

  bool backButtonInterceptor(bool stopDefaultButtonEvent) {
    if (stopDefaultButtonEvent || !widget.promptDialogIsVisible) return false;
    widget.dismissPromptDialog();
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
                ),
                Container(
                  height: 20,
                ),
                HomeButton(
                  title: "Assistir",
                  leading: Icon(Icons.remove_red_eye, color: Colors.white,),
                  onTap: widget.showPromptDialog,
                  roundBottomBorder: true,
                  roundTopBorder: true,
                ),
              ],
            ),
          ),
          Visibility(
            visible: widget.promptDialogIsVisible,
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
    widget.initGameBoard(d);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => GameConnector()));
  }
}

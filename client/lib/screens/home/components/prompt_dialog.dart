import 'package:business/business.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PromptDialog extends StatefulWidget {
  PromptDialog({@required this.onSubmit, @required this.onDismiss, @required this.shareCode});

  final void Function(String) onSubmit;
  final void Function() onDismiss;
  final AsyncData<String> shareCode;

  @override
  _PromptDialogState createState() => _PromptDialogState();
}

class _PromptDialogState extends State<PromptDialog> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(top: 24, left: 24, right: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      content: TextField(
        controller: controller,
        onSubmitted: widget.onSubmit,
        autofocus: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            suffixIcon: widget.shareCode.isWaiting ? renderLoading() : null,
            enabled: !widget.shareCode.isWaiting,
            labelText: "Insira o código",
            errorText: widget.shareCode.hasError ? 'Código inválido' : null),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            widget.onDismiss();
          },
          child: Text("Cancelar".toUpperCase()),
        ),
        FlatButton(
          onPressed: () {
            widget.onSubmit(controller.text);
          },
          child: Text("Ok".toUpperCase()),
        ),
      ],
    );
  }

  Widget renderLoading() {
    if (true) {
      return UnconstrainedBox(
        child: SizedBox(
          height: 18,
          width: 18,
          child: CircularProgressIndicator(strokeWidth: 2,),
        ),
      );
    }
    return null;
  }
}

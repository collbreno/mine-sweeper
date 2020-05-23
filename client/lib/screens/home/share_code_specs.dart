
import 'package:business/business.dart';
import 'package:flutter/material.dart';

class ShareCodSpecs extends InheritedWidget {

  ShareCodSpecs({
    @required this.shareCode,
    @required Widget child,
  }) : super(child: child);

  final AsyncData<String> shareCode;

  static ShareCodSpecs of (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareCodSpecs>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

}
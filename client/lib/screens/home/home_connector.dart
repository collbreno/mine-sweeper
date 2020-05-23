import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';
import 'package:client/screens/home/share_code_specs.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class HomeConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      model: ViewModel(),
      builder: (BuildContext context, ViewModel vm) {
        return Home(
          initGameBoard: vm.initBoard,
          promptDialogIsVisible: vm.promptDialogIsVisible,
          navigateEvt: vm.navigateEvt,
          showPromptDialog: vm.showPromptDialog,
          checkIfIdExists: vm.checkIfGameExists,
          shareCode: vm.shareCode,
          dismissPromptDialog: vm.dismissPromptDialog,
        );
      },
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();

  void Function(Difficulty) initBoard;
  void Function() showPromptDialog;
  void Function() dismissPromptDialog;
  void Function(String) checkIfGameExists;
  bool promptDialogIsVisible;
  Event navigateEvt;
  AsyncData<String> shareCode;

  ViewModel.build({
    @required this.initBoard,
    @required this.promptDialogIsVisible,
    @required this.showPromptDialog,
    @required this.dismissPromptDialog,
    @required this.checkIfGameExists,
    @required this.navigateEvt,
    @required this.shareCode,
  }) : super(equals: [
    promptDialogIsVisible,
    navigateEvt,
    shareCode,
  ]);

  @override
  ViewModel fromStore() {
    return ViewModel.build(
      initBoard: (Difficulty d) => dispatch(CreateEmptyBoardAction(d)),
      promptDialogIsVisible: state.cloudState.promptDialogIsVisible,
      showPromptDialog: () => dispatch(ShowPromptDialogAction()),
      dismissPromptDialog: () => dispatch(DismissPromptDialogAction()),
      checkIfGameExists: (id) => dispatch(CheckIfGameExistsAction(id)),
      navigateEvt: state.cloudState.navigateEvt,
      shareCode: state.cloudState.shareCode,
    );
  }
}
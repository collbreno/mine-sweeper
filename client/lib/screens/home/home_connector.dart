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
          isPromptDialogVisible: vm.isPromptDialogVisible,
          navigateEvt: vm.navigateEvt,
          showPromptDialog: vm.showPromptDialog,
          checkIfIdExists: vm.checkIfGameExists,
          shareCode: vm.shareCode,
          dismissPromptDialog: vm.dismissPromptDialog,
          collapsePlayButton: vm.collapsePlayButton,
          expandPlayButton: vm.expandPlayButton,
          isPlayButtonCollapsed: vm.isPlayButtonCollapsed,
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
  void Function() expandPlayButton;
  void Function() collapsePlayButton;
  bool isPromptDialogVisible;
  bool isPlayButtonCollapsed;
  Event navigateEvt;
  AsyncData<String> shareCode;

  ViewModel.build({
    @required this.initBoard,
    @required this.isPromptDialogVisible,
    @required this.showPromptDialog,
    @required this.expandPlayButton,
    @required this.collapsePlayButton,
    @required this.dismissPromptDialog,
    @required this.checkIfGameExists,
    @required this.navigateEvt,
    @required this.shareCode,
    @required this.isPlayButtonCollapsed,
  }) : super(equals: [
    isPromptDialogVisible,
    navigateEvt,
    shareCode,
    isPlayButtonCollapsed,
  ]);

  @override
  ViewModel fromStore() {
    return ViewModel.build(
      initBoard: (Difficulty d) => dispatch(CreateEmptyBoardAction(d)),
      isPromptDialogVisible: state.homeState.isPromptDialogVisible,
      isPlayButtonCollapsed: state.homeState.isPlayButtonCollapsed,
      showPromptDialog: () => dispatch(ShowPromptDialogAction()),
      expandPlayButton: () => dispatch(ExpandPlayButtonAction()),
      collapsePlayButton: () => dispatch(CollapsePlayButtonAction()),
      dismissPromptDialog: () => dispatch(DismissPromptDialogAction()),
      checkIfGameExists: (id) => dispatch(CheckIfGameExistsAction(id)),
      navigateEvt: state.cloudState.navigateEvt,
      shareCode: state.cloudState.shareCode,
    );
  }
}
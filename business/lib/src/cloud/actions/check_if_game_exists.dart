import 'dart:async';

import 'package:business/business.dart';

class CheckIfGameExistsAction extends CloudAction {
  CheckIfGameExistsAction(this.id);

  final String id;

  @override
  Future<CloudState> reduceCloudState() async {
    print('entrei aqui');
    if (id != null && id.isNotEmpty && await FirestoreService().checkIfGameExists(id)) {
      dispatch(StartListenGameAction(id));
      dispatch(NavigateToGameScreenAction());
      dispatch(DismissPromptDialogAction());
    }
    else {
      dispatch(SetShareCodeToErrorAction());
    }
    return null;
  }

  @override
  void before() => dispatch(SetShareCodeToLoadingAction());
}

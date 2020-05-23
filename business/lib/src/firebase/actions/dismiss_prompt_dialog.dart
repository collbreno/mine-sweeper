import 'dart:async';

import 'package:business/business.dart';

class DismissPromptDialogAction extends CloudAction {
  @override
  CloudState reduceCloudState() {
    return cloudState.copy(
      promptDialogIsVisible: false
    );
  }

}
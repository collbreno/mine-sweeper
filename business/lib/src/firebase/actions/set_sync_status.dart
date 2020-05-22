import 'package:business/business.dart';

class SetSyncStatusAction extends CloudAction {
  SetSyncStatusAction(this.status);
  final SyncStatus status;
  @override
  CloudState reduceCloudState() {
    return cloudState.copy(
      syncStatus: status
    );
  }

}
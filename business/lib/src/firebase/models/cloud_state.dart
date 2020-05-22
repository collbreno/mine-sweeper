import 'package:business/business.dart';

class CloudState {
  final AsyncData<String> shareCode;
  final bool isRemote;
  final SyncStatus syncStatus;

  CloudState({
    this.shareCode,
    this.isRemote,
    this.syncStatus,
  });

  CloudState copy({
    bool isRemote,
    AsyncData<String> shareCode,
    SyncStatus syncStatus,
  }) {
    return CloudState(
      shareCode: shareCode ?? this.shareCode,
      isRemote: isRemote ?? this.isRemote,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  static CloudState initialState() => CloudState(
      shareCode: AsyncData.nothing(),
      isRemote: false,
      syncStatus: SyncStatus(
        isSyncingTilesToDiscover: false,
        isSyncingTilesState: false,
        isSyncingTilesContent: false,
        isSyncingNumberOfBombs: false,
        isSyncingGameProgress: false,
      ));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CloudState &&
          runtimeType == other.runtimeType &&
          shareCode == other.shareCode &&
          syncStatus == other.syncStatus &&
          isRemote == other.isRemote;

  @override
  int get hashCode =>
      shareCode.hashCode ^ isRemote.hashCode ^ syncStatus.hashCode;
}

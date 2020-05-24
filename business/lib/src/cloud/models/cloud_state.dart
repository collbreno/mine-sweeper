import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';

class CloudState {
  final AsyncData<String> shareCode;
  final bool isRemote;
  final SyncStatus syncStatus;
  final Event navigateEvt;
  static Stream<BoardCloudSpecs> gameStream;


  CloudState({
    this.shareCode,
    this.isRemote,
    this.syncStatus,
    this.navigateEvt,
  });

  CloudState copy({
    bool isRemote,
    AsyncData<String> shareCode,
    SyncStatus syncStatus,
    Event navigateEvt
  }) {
    return CloudState(
      shareCode: shareCode ?? this.shareCode,
      isRemote: isRemote ?? this.isRemote,
      syncStatus: syncStatus ?? this.syncStatus,
      navigateEvt: navigateEvt ?? this.navigateEvt,
    );
  }

  static CloudState initialState() => CloudState(
      shareCode: AsyncData.nothing(),
      isRemote: false,
      navigateEvt: Event.spent(),
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

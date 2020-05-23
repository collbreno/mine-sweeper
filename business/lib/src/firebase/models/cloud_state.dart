import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';

class CloudState {
  final AsyncData<String> shareCode;
  final bool isRemote;
  final SyncStatus syncStatus;
  final bool promptDialogIsVisible;
  final Event navigateEvt;
  static Stream<BoardSpecs> gameStream;


  CloudState({
    this.shareCode,
    this.isRemote,
    this.syncStatus,
    this.promptDialogIsVisible,
    this.navigateEvt,
  });

  CloudState copy({
    bool isRemote,
    AsyncData<String> shareCode,
    SyncStatus syncStatus,
    bool promptDialogIsVisible,
    Event navigateEvt
  }) {
    return CloudState(
      shareCode: shareCode ?? this.shareCode,
      isRemote: isRemote ?? this.isRemote,
      syncStatus: syncStatus ?? this.syncStatus,
      promptDialogIsVisible: promptDialogIsVisible ?? this.promptDialogIsVisible,
      navigateEvt: navigateEvt ?? this.navigateEvt,
    );
  }

  static CloudState initialState() => CloudState(
      shareCode: AsyncData.nothing(),
      isRemote: false,
      promptDialogIsVisible: false,
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
          promptDialogIsVisible == other.promptDialogIsVisible &&
          isRemote == other.isRemote;

  @override
  int get hashCode =>
      shareCode.hashCode ^ isRemote.hashCode ^ syncStatus.hashCode ^ promptDialogIsVisible.hashCode;
}

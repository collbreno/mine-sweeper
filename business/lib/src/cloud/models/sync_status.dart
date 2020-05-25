class SyncStatus {
  final bool isSyncingTilesState;
  final bool isSyncingTilesContent;
  final bool isSyncingGameProgress;
  final bool isSyncingNumberOfBombs;
  final bool isSyncingTilesToDiscover;
  final bool isSyncingStartTime;
  final bool isSyncingFinishTime;

  SyncStatus({
    this.isSyncingTilesState = false,
    this.isSyncingTilesContent = false,
    this.isSyncingGameProgress = false,
    this.isSyncingNumberOfBombs = false,
    this.isSyncingTilesToDiscover = false,
    this.isSyncingStartTime = false,
    this.isSyncingFinishTime = false,
  });

  SyncStatus copy({
    bool isSyncingTilesState,
    bool isSyncingTilesContent,
    bool isSyncingGameProgress,
    bool isSyncingNumberOfBombs,
    bool isSyncingTilesToDiscover,
    bool isSyncingStartTime,
    bool isSyncingFinishTime,
  }) =>
      SyncStatus(
        isSyncingGameProgress:
            isSyncingGameProgress ?? this.isSyncingGameProgress,
        isSyncingNumberOfBombs:
            isSyncingNumberOfBombs ?? this.isSyncingNumberOfBombs,
        isSyncingTilesContent:
            isSyncingTilesContent ?? this.isSyncingTilesContent,
        isSyncingTilesState: isSyncingTilesState ?? this.isSyncingTilesState,
        isSyncingTilesToDiscover:
            isSyncingTilesToDiscover ?? this.isSyncingTilesToDiscover,
        isSyncingStartTime: isSyncingStartTime ?? this.isSyncingStartTime,
        isSyncingFinishTime: isSyncingFinishTime ?? this.isSyncingFinishTime,
      );

  bool get isSyncing =>
      isSyncingGameProgress ||
      isSyncingTilesContent ||
      isSyncingTilesState ||
      isSyncingFinishTime ||
      isSyncingStartTime ||
      isSyncingNumberOfBombs ||
      isSyncingTilesToDiscover;
}

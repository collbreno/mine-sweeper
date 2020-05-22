class SyncStatus {
  final bool isSyncingTilesState;
  final bool isSyncingTilesContent;
  final bool isSyncingGameProgress;
  final bool isSyncingNumberOfBombs;
  final bool isSyncingTilesToDiscover;

  SyncStatus({
    this.isSyncingTilesState,
    this.isSyncingTilesContent,
    this.isSyncingGameProgress,
    this.isSyncingNumberOfBombs,
    this.isSyncingTilesToDiscover,
  });

  SyncStatus copy({
    bool isSyncingTilesState,
    bool isSyncingTilesContent,
    bool isSyncingGameProgress,
    bool isSyncingNumberOfBombs,
    bool isSyncingTilesToDiscover,
  }) =>
      SyncStatus(
        isSyncingGameProgress: isSyncingGameProgress ?? this.isSyncingGameProgress,
        isSyncingNumberOfBombs: isSyncingNumberOfBombs ?? this.isSyncingNumberOfBombs,
        isSyncingTilesContent: isSyncingTilesContent ?? this.isSyncingTilesContent,
        isSyncingTilesState: isSyncingTilesState ?? this.isSyncingTilesState,
        isSyncingTilesToDiscover: isSyncingTilesToDiscover ?? this.isSyncingTilesToDiscover,
      );

  bool get isSyncing =>
      isSyncingGameProgress ||
      isSyncingTilesContent ||
      isSyncingTilesState ||
      isSyncingNumberOfBombs ||
      isSyncingTilesToDiscover;
}

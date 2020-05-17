import 'package:async_redux/async_redux.dart';
import 'package:mine_sweeper/business/game/models/game_progress.dart';
import 'package:mine_sweeper/business/game/models/tile.dart';

class GameState {
  final int horizontalTiles;
  final int verticalTiles;
  final int numberOfBombs;
  final int tilesToDiscover;
  final GameProgress gameProgress;
  final List<Tile> tiles;
  final Event<DialogType> showDialogEvt;
  final Duration timeElapsed;

  GameState({
    this.horizontalTiles,
    this.verticalTiles,
    this.numberOfBombs,
    this.tiles,
    this.showDialogEvt,
    this.tilesToDiscover,
    this.timeElapsed,
    this.gameProgress
  });

  GameState copy({ 
    int horizontalTiles, 
    int verticalTiles, 
    int numberOfBombs, 
    int tilesToDiscover,
    List<Tile>tiles,
    Event<DialogType> showDialogEvt,
    Duration timeElapsed,
    GameProgress gameProgress
  }) {
    return GameState(
      horizontalTiles: horizontalTiles ?? this.horizontalTiles,
      numberOfBombs: numberOfBombs ?? this.numberOfBombs,
      verticalTiles: verticalTiles ?? this.verticalTiles,
      tilesToDiscover: tilesToDiscover ?? this.tilesToDiscover,
      tiles: tiles ?? this.tiles,
      showDialogEvt: showDialogEvt ?? this.showDialogEvt,
      timeElapsed: timeElapsed ?? this.timeElapsed,
      gameProgress: gameProgress ?? this.gameProgress,
    );
  }

  static GameState initialState() => 
    GameState(
      horizontalTiles: 0,
      verticalTiles: 0,
      tilesToDiscover: 0,
      numberOfBombs: 0,
      tiles: List<Tile>(),
      gameProgress: GameProgress.none,
      showDialogEvt: Event<DialogType>.spent(),
      timeElapsed: Duration()
    );

  @override
  bool operator ==(Object other) => 
    identical(this, other) || other is GameState && runtimeType == other.runtimeType &&
                              tiles == other.tiles && 
                              tiles.map((tile) => tile.content) == other.tiles.map((tile) => tile.content) &&
                              horizontalTiles == other.horizontalTiles && 
                              verticalTiles == other.verticalTiles && 
                              timeElapsed == other.timeElapsed &&
                              timeElapsed.inMilliseconds == other.timeElapsed.inMilliseconds &&
                              tilesToDiscover == other.tilesToDiscover &&
                              gameProgress == other.gameProgress &&
                              numberOfBombs == other.numberOfBombs;

  @override
  int get hashCode => horizontalTiles.hashCode ^ 
                      verticalTiles.hashCode ^ 
                      numberOfBombs.hashCode ^ 
                      timeElapsed.hashCode ^
                      timeElapsed.inMilliseconds.hashCode ^
                      tilesToDiscover.hashCode ^
                      gameProgress.hashCode ^
                      tiles.map((tile) => tile.content).hashCode ^
                      tiles.map((tile) => tile.state).hashCode;
}

enum Difficulty {
  easy,
  normal, 
  hard
}

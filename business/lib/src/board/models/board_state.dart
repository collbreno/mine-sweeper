import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';
class BoardState {
  final BoardSize boardSize;
  final int numberOfBombs;
  final int tilesToDiscover;
  final GameProgress gameProgress;
  final List<Tile> tiles;
  final Event<DialogType> showDialogEvt;
  final Duration timeElapsed;

  BoardState({
    this.boardSize,
    this.numberOfBombs,
    this.tiles,
    this.showDialogEvt,
    this.tilesToDiscover,
    this.timeElapsed,
    this.gameProgress,
  });

  BoardState copy({
    BoardSize boardSize,
    int numberOfBombs, 
    int tilesToDiscover,
    List<Tile>tiles,
    Event<DialogType> showDialogEvt,
    Duration timeElapsed,
    GameProgress gameProgress,
  }) {
    return BoardState(
      numberOfBombs: numberOfBombs ?? this.numberOfBombs,
      boardSize: boardSize ?? this.boardSize,
      tilesToDiscover: tilesToDiscover ?? this.tilesToDiscover,
      tiles: tiles ?? this.tiles,
      showDialogEvt: showDialogEvt ?? this.showDialogEvt,
      timeElapsed: timeElapsed ?? this.timeElapsed,
      gameProgress: gameProgress ?? this.gameProgress,
    );
  }

  static BoardState initialState() =>
    BoardState(
      boardSize: BoardSize(height: 0, width: 0),
      tilesToDiscover: 0,
      numberOfBombs: 0,
      tiles: List<Tile>(),
      gameProgress: GameProgress.none,
      showDialogEvt: Event<DialogType>.spent(),
      timeElapsed: Duration(),
    );

  @override
  bool operator ==(Object other) => 
    identical(this, other) || other is BoardState && runtimeType == other.runtimeType &&
                              tiles == other.tiles && 
                              tiles.map((tile) => tile.content) == other.tiles.map((tile) => tile.content) &&
                              boardSize == other.boardSize &&
                              timeElapsed == other.timeElapsed &&
                              timeElapsed.inMilliseconds == other.timeElapsed.inMilliseconds &&
                              tilesToDiscover == other.tilesToDiscover &&
                              gameProgress == other.gameProgress &&
                              numberOfBombs == other.numberOfBombs;

  @override
  int get hashCode => boardSize.hashCode ^
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

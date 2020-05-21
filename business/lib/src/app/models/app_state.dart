
import 'package:business/src/firebase/models/cloud_state.dart';
import '../../../business.dart';


class AppState {
  final BoardState boardState;
  final CloudState cloudState;

  AppState({
    this.boardState,
    this.cloudState,
  });

  AppState copy({
    BoardState boardState,
    CloudState cloudState,
  }) {
    return AppState(
      cloudState: cloudState ?? this.cloudState,
      boardState: boardState ?? this.boardState,
    );
  }

  static AppState initialState() => AppState(
        boardState: BoardState.initialState(),
        cloudState: CloudState.initialState(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AppState && runtimeType == other.runtimeType &&
          BoardState == other.boardState && cloudState == other.cloudState;

  @override
  int get hashCode => boardState.hashCode ^ cloudState.hashCode;
}

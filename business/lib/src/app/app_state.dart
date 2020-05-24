import 'package:business/src/home/models/home_state.dart';
import '../../business.dart';

class AppState {
  final BoardState boardState;
  final CloudState cloudState;
  final HomeState homeState;

  AppState({
    this.boardState,
    this.cloudState,
    this.homeState,
  });

  AppState copy({
    BoardState boardState,
    CloudState cloudState,
    HomeState homeState,
  }) {
    return AppState(
      cloudState: cloudState ?? this.cloudState,
      boardState: boardState ?? this.boardState,
      homeState: homeState ?? this.homeState,
    );
  }

  static AppState initialState() => AppState(
        boardState: BoardState.initialState(),
        cloudState: CloudState.initialState(),
        homeState: HomeState.initialState(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          boardState == other.boardState &&
          cloudState == other.cloudState &&
          homeState == other.homeState;

  @override
  int get hashCode =>
      boardState.hashCode ^ cloudState.hashCode ^ homeState.hashCode;
}

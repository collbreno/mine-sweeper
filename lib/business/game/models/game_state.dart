class GameState {
  final String title;
  final int count;

  GameState({
    this.title,
    this.count
  });

  GameState copy({ String title, int count }) {
    return GameState(
      count: count ?? this.count,
      title: title ?? this.title
    );
  }

  static GameState initialState() => 
    GameState(
      title: '',
      count: 0
    );

  @override
  bool operator ==(Object other) => 
    identical(this, other) || other is GameState && runtimeType == other.runtimeType 
    && title == other.title && count == other.count;

  @override
  int get hashCode => title.hashCode ^ count.hashCode;
}
class BoardSize {
  BoardSize({this.height, this.width});

  final int height;
  final int width;

  int get total => width * height;

  static BoardSize of(Difficulty difficulty) {
    switch (difficulty) {
      case Difficulty.easy:
        return BoardSize(width: 8, height: 12);
      case Difficulty.normal:
        return BoardSize(width: 10, height: 15);
      case Difficulty.hard:
        return BoardSize(width: 15, height: 20);
    }
    return null;
  }
}

enum Difficulty {
  easy,
  normal,
  hard,
}

class BoardSize {
  BoardSize({this.height, this.width});

  final int height;
  final int width;

  int get total => width*height;
}
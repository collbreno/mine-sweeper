import 'package:mine_sweeper/main.dart';

class NeighborhoodService {
  NeighborhoodService();

  List<int> getNeighborsIndexes(int index){
    // return [5];
    List<int> validNeighbors = List<int>();
    MatrixIndex matrixIndex = _getMatrixIndex(index);

    List<int> iValues = List<int>();
    List<int> jValues = List<int>();

    if (matrixIndex.i-1 >= 0) iValues.add(matrixIndex.i-1);
    iValues.add(matrixIndex.i);
    if (matrixIndex.i+1 < store.state.verticalTiles) iValues.add(matrixIndex.i+1);

    if (matrixIndex.j-1 >= 0) jValues.add(matrixIndex.j-1);
    jValues.add(matrixIndex.j);
    if (matrixIndex.j+1 < store.state.horizontalTiles) jValues.add(matrixIndex.j+1);

    for (int i in iValues){
      for (int j in jValues){
        int listIndex = _getListIndex(MatrixIndex(i, j));
        if (listIndex != index) validNeighbors.add(listIndex);
      }
    }

    return validNeighbors;
    
  }

  int _getListIndex(MatrixIndex matrixIndex) {
    return matrixIndex.i * store.state.horizontalTiles + matrixIndex.j;
  }

  MatrixIndex _getMatrixIndex(int listIndex){
    int i = listIndex ~/ store.state.horizontalTiles;
    int j = listIndex % store.state.horizontalTiles;
    return MatrixIndex(i, j);
  }

}

class MatrixIndex {
  MatrixIndex(this.i, this.j);
  final int i;
  final int j;
}
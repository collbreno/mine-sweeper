import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';

class ConvertTilesContentToString extends CloudAction {
  ConvertTilesContentToString(this.tilesToTranslate);
  List<Tile> tilesToTranslate;

  @override
  CloudState reduceCloudState() {
    var string = tilesToTranslate.fold('', (acc, current) => acc += current.content.index.toString());
    // print('Tiles content: $string');
    return null;
  }

}
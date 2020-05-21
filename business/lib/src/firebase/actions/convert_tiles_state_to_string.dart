import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';

class ConvertTilesStateToStringAction extends CloudAction {
  ConvertTilesStateToStringAction(this.tilesToTranslate);
  final List<Tile> tilesToTranslate;

  @override
  CloudState reduceCloudState() {
    var string = tilesToTranslate.fold('', (acc, current) => acc += current.state.index.toString());
    // print('Tiles state: $string');
    return null;
  }

}
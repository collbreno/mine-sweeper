import 'dart:math';

import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';
import 'package:client/screens/game/components/footer.dart';
import 'package:client/screens/game/tile_specs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/app_bar_item.dart';
import 'components/defeat_dialog.dart';
import 'components/tile_widget.dart';
import 'components/victory_dialog.dart';

class Game extends StatefulWidget {
  Game({
    @required this.verticalTiles,
    @required this.horizontalTiles,
    @required this.numberOfBombs,
    @required this.tiles,
    @required this.makeAMove,
    @required this.toggleFlag,
    @required this.newGame,
    @required this.showDialogEvt,
    @required this.gameProgress,
    @required this.secondsElapsed,
    @required this.shareCode,
    @required this.shareGame,
    @required this.isSyncing,
    @required this.isWatching,
    @required this.cancelListen,
  });

  final int verticalTiles;
  final int horizontalTiles;
  final int numberOfBombs;
  final List<Tile> tiles;
  final void Function(int) toggleFlag;
  final void Function(int) makeAMove;
  final void Function() newGame;
  final void Function() cancelListen;
  final GameProgress gameProgress;
  final Event<DialogType> showDialogEvt;
  final int secondsElapsed;
  final AsyncData<String> shareCode;
  final void Function() shareGame;
  final bool isSyncing;
  final bool isWatching;

  final double footerHeight = 64;
  final Color backgroundColor = Colors.grey[900];

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Game> {
  @override
  void didUpdateWidget(Game oldWidget) {
    super.didUpdateWidget(oldWidget);
    consumeEvents();
  }

  @override
  void dispose() {
    if (widget.isWatching) widget.cancelListen();
    super.dispose();
  }

  void consumeEvents() {
    var payload = widget.showDialogEvt.consume();
    if (payload != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
            context: context,
            builder: (context) {
              if (payload == DialogType.defeat)
                return DefeatDialog(
                  newGame: widget.newGame,
                );
              return VictoryDialog(
                seconds: widget.secondsElapsed,
                newGame: widget.newGame,
              );
            });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AppBarItem(
              imagePath: 'assets/images/bomb.png',
              text: ": ${widget.numberOfBombs}",
            ),
            Padding(
              padding: EdgeInsets.only(right: 50),
              child: AppBarItem(
                imagePath: 'assets/images/timer.png',
                text: ": ${widget.secondsElapsed}s",
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: Material(
        color: widget.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            renderGrid(),
            renderFooter(),
          ],
        ),
      ),
    );
  }

  Widget renderFooter() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: widget.footerHeight,
          color: widget.backgroundColor,
          child: Center(child: renderFooterContent()),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 12),
            child: Visibility(
              visible: widget.isSyncing,
              child: Icon(Icons.sync, color: Colors.white,),
            ),
          ),
        ),
      ],
    );
  }

  Widget renderFooterContent() {
    if (widget.isWatching) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(widget.shareCode.data ?? '', style: TextStyle(fontSize: 14, color: Colors.white),),
          Icon(Icons.remove_red_eye, color: Colors.white,),
        ],
      );
    }
    if (widget.shareCode.isWaiting) {
      return renderLoader();
    }
    if (widget.shareCode.hasError) {
      return renderTryAgainButton();
    }
    if (widget.shareCode.hasData) {
      return renderShareButton(widget.shareCode.data);
    }
    return renderNewShareButton();
  }

  Widget renderTryAgainButton() {
    return Footer(
      height: widget.footerHeight * 2 / 3,
      onTap: widget.shareGame,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.warning,
            color: Colors.white,
          ),
          Container(
            width: 12,
          ),
          Text(
            "Algo deu errado.\nTente novamente.",
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          Container(
            width: 24,
          ),
          Icon(
            Icons.refresh,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget renderShareButton(String shareCode) {
    return Footer(
      height: widget.footerHeight * 2 / 3,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            shareCode,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          IconButton(
            icon: Icon(
              Icons.content_copy,
              color: Colors.white,
            ),
            splashColor: Colors.white,
            onPressed: () {
              Clipboard.setData(ClipboardData(text: shareCode));
            },
          ),
        ],
      ),
    );
  }

  Widget renderNewShareButton() {
    return Footer(
      height: widget.footerHeight * 2 / 3,
      onTap: widget.shareGame,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "Compartilhe seu jogo",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Container(
            width: 24,
          ),
          Icon(
            Icons.share,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget renderLoader() {
    return Center(
      child: Container(
        height: widget.footerHeight / 3,
        width: widget.footerHeight / 3,
        child: CircularProgressIndicator(
          strokeWidth: widget.footerHeight / 20,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }

  Widget renderGrid() {
    return Builder(
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: getTileSize(context) * widget.verticalTiles,
            width: getTileSize(context) * widget.horizontalTiles,
            child: GridView.builder(
              itemCount: this.widget.tiles.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.horizontalTiles,
                // childAspectRatio: getTileSize(context),
              ),
              itemBuilder: (context, index) {
                return TileSpecs(
                  onPress: handlePress(index),
                  onLongPress: handleLongPress(index),
                  tile: widget.tiles.elementAt(index),
                  gameProgress: widget.gameProgress,
                  child: TileSquare(),
                );
              },
            ),
          ),
        );
      },
    );
  }

  double getTileSize(BuildContext context) {
    double appBarHeight = Scaffold.of(context).appBarMaxHeight;
    var screenSize = MediaQuery.of(context).size;
    double availableHeight =
        screenSize.height - appBarHeight - widget.footerHeight;
    double availableWidth = screenSize.width;
    double maxHeight = availableHeight / widget.verticalTiles;
    double maxWidth = availableWidth / widget.horizontalTiles;
    return min(maxHeight, maxWidth);
  }

  void Function() handlePress(int index) {
    if (widget.makeAMove == null) return null;
    if (widget.gameProgress == GameProgress.user_lost ||
        widget.gameProgress == GameProgress.user_won) return null;
    return () => widget.makeAMove(index);
  }

  void Function() handleLongPress(int index) {
    if (widget.toggleFlag == null) return null;
    if (widget.gameProgress != GameProgress.inProgress) return null;
    return () => widget.toggleFlag(index);
  }
}

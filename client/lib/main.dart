import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';
import 'package:client/screens/home/home_connector.dart';
import 'package:flutter/material.dart';

Store<GameState> store;

void main() {
  store = Store<GameState>(initialState: GameState.initialState());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<GameState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeConnector(),
      ),
    );
  }
}

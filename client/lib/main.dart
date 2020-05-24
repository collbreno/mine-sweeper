import 'package:async_redux/async_redux.dart';
import 'package:business/business.dart';
import 'package:client/screens/home/home_connector.dart';
import 'package:flutter/material.dart';

Store<AppState> store;

void main() {
  store = Store<AppState>(initialState: AppState.initialState());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Campo Minado',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeConnector(),
      ),
    );
  }
}

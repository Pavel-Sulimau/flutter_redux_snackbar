import 'package:flutter_redux_snackbar/presentation/home_screen.dart';
import 'package:flutter_redux_snackbar/redux/middleware.dart';
import 'package:flutter_redux_snackbar/redux/reducers.dart';
import 'package:flutter_redux_snackbar/redux/state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: createAppMiddleware(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        home: HomeScreen(),
        theme: ThemeData(
          primaryColor: Colors.green,
          accentColor: Colors.green,
        ),
      ),
    );
  }
}

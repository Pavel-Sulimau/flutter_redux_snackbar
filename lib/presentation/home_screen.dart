import 'package:flutter_redux_snackbar/models/quote.dart';
import 'package:flutter_redux_snackbar/presentation/error_notifier.dart';
import 'package:flutter_redux_snackbar/redux/actions.dart';
import 'package:flutter_redux_snackbar/redux/state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      builder: (context, vm) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Flutter with Redux - SnackBar'),
          ),
          body: ErrorNotifier(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: vm.isLoading
                    ? CircularProgressIndicator()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (vm.quote?.text != null)
                            Text(
                              vm.quote.text,
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          if (vm.quote?.author != null)
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(vm.quote.author),
                            )
                        ],
                      ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: vm.refreshQuote,
            tooltip: 'Refresh',
            child: Icon(Icons.refresh),
          ),
        );
      },
      converter: _ViewModel.fromStore,
      onInit: (store) {
        store.dispatch(
          LoadQuoteAction(),
        );
      },
    );
  }
}

class _ViewModel {
  _ViewModel({
    this.isLoading,
    this.quote,
    this.store,
  });

  final bool isLoading;
  final Quote quote;
  final Store store;

  void refreshQuote() {
    store.dispatch(LoadQuoteAction());
  }

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      isLoading: store.state.isLoading,
      quote: store.state.quote,
      store: store,
    );
  }
}

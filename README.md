# flutter_redux_snackbar

## Purpose:
The sample demonstrates how you can display a toast notification (SnackBar) in your Flutter + Redux solution.

## Demo:
<img src="https://user-images.githubusercontent.com/8143332/61171955-29aecb80-a587-11e9-8f0d-50cafb658f7a.gif" width="375" height="667" />

## The piece of particular interest:
```dart
class ErrorNotifier extends StatelessWidget {
  ErrorNotifier({
    @required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.fromStore(store),
      builder: (context, vm) => child,
      onWillChange: (vm) {
        if (vm.error != null) {
          vm.markErrorAsHandled();
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(vm.error.toString()),
            ),
          );
        }
      },
      distinct: true,
    );
  }
}

class _ViewModel {
  _ViewModel({
    this.markErrorAsHandled,
    this.error,
  });

  final Function markErrorAsHandled;
  final Exception error;

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      markErrorAsHandled: () => store.dispatch(ErrorHandledAction()),
      error: store.state.error,
    );
  }

  @override
  int get hashCode => error.hashCode;

  @override
  bool operator ==(other) =>
      identical(this, other) || other is _ViewModel && other.error == this.error;
}
```

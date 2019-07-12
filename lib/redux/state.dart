import 'package:flutter_redux_snackbar/models/quote.dart';

class AppState {
  AppState({
    this.isLoading,
    this.quote,
    this.error,
  });

  final bool isLoading;
  final Quote quote;
  final Exception error;

  factory AppState.initial() => AppState(isLoading: false, quote: null, error: null);

  AppState copyWith({
    bool isLoading,
    Quote quote,
    Exception error,
  }) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      quote: quote ?? this.quote,
      error: error ?? this.error,
    );
  }
}

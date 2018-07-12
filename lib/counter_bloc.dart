import 'dart:async';

import 'package:rxdart/subjects.dart';

/// CounterBloc takes a stream of button clicks and exposes the total number of
/// times the button has been clicked as a stream.
class CounterBloc {
  /// increment is a sink for tap events on the increment button.
  final Sink<void> increment;

  /// counter is a stream that tracks the number of times we've seen an
  /// increment.
  final Stream<int> counter;

  factory CounterBloc() {
    final onIncrement = PublishSubject<void>();

    final counter = onIncrement
        // Accumulate all the click events, counting them.
        .scan<int>((acc, curr, i) => ++acc, 0)
        // Initially publish a zero value for the counter.
        .startWith(0);

    return CounterBloc._(onIncrement, counter);
  }

  CounterBloc._(this.increment, this.counter);

  /// Clean up any sinks.
  void dispose() {
    increment.close();
  }
}

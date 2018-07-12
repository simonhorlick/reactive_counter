import 'dart:async';

import 'package:reactive_counter/counter_bloc.dart';
import 'package:test/test.dart';

void main() {
  group('CounterBloc', () {
    test('starts with an initial state of zero', () {
      final bloc = CounterBloc();

      expect(
        bloc.counter,
        emitsInOrder([0]),
      );
    });

    test('emits an updated count when incremented', () {
      final bloc = CounterBloc();

      scheduleMicrotask(() {
        bloc.increment.add(null);
      });

      expect(
        bloc.counter,
        emitsInOrder([0, 1]),
      );
    });
  });
}

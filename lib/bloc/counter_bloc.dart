import 'dart:async';

import 'package:bloc_counter_app/bloc/counter_event.dart';
import 'package:bloc_counter_app/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counterValue: 0)) {
    on<IncrementEvent>(_onIncrementEvent);
    on<ResetEvent>(_onResetEvent);
    on<DecreaseEvent>(_onDecreaseEvent);
  }

  void _onIncrementEvent(IncrementEvent event, Emitter<CounterState> emit) {
    emit(CounterState(counterValue: state.counterValue + 1));
  }

  FutureOr<void> _onResetEvent(ResetEvent event, Emitter<CounterState> emit) {
    emit(CounterState(counterValue: 0));
  }

  FutureOr<void> _onDecreaseEvent(
    DecreaseEvent event,
    Emitter<CounterState> emit,
  ) {
    emit(CounterState(counterValue: state.counterValue - 1));
  }
}

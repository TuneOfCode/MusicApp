import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app_client/src/modules/counter/counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc(int initialState) : super(initialState) {
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
    on<CounterDecrementPressed>((event, emit) => emit(state - 1));
    on<CounterResetPressed>((event, emit) => emit(0));
  }
}

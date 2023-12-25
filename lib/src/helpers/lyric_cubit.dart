import 'package:flutter_bloc/flutter_bloc.dart';

class LyricCubit extends Cubit<bool> {
  LyricCubit(bool initialState) : super(initialState);

  void enableLyrics() => emit(!state);
}

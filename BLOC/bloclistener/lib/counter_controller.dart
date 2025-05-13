import 'package:flutter_bloc/flutter_bloc.dart';

class CounterController extends Cubit<int> {
  CounterController() : super(0);

  void sum() {
    emit(state + 1);
  }

  void min() {
    emit(state - 1);
  }
}

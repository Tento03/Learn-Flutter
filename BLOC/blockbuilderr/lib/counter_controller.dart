import 'package:bloc/bloc.dart';

class CounterController extends Cubit<int> {
  CounterController() : super(0);

  void sum() {
    emit(state + 1);
  }

  void min() {
    emit(state - 1);
  }
}

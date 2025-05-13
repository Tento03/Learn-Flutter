import 'package:bloc/bloc.dart';

class CounterController extends Cubit<int> {
  CounterController() : super(0);

  void tambah() {
    emit(state + 1);
  }
}

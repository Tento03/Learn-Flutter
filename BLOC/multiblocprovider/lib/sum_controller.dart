import 'package:bloc/bloc.dart';

class SumController extends Cubit<int> {
  SumController() : super(0);

  void sum() {
    emit(state + 1);
  }
}

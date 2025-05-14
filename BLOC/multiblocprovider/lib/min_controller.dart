import 'package:flutter_bloc/flutter_bloc.dart';

class MinController extends Cubit<int> {
  MinController() : super(0);

  void min() {
    emit(state - 1);
  }
}

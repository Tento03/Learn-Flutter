import 'package:bloc/bloc.dart';
import 'package:di/counter_repository.dart';

class CounterController extends Cubit<int> {
  final CounterRepository repository;

  CounterController(this.repository) : super(0);

  void sum() {
    emit(repository.increment(state));
  }
}

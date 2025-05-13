import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  int? current;
  int? next;

  void add() {
    emit(state + 1);
  }

  @override
  void onChange(Change<int> change) {
    // TODO: implement onChange
    super.onChange(change);
    current = change.currentState;
    next = change.nextState;
  }
}

class MyApp extends StatelessWidget {
  final CounterCubit counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ass')),
        body: Center(
          child: Column(
            children: [
              StreamBuilder(
                stream: counterCubit.stream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: Text('loading'));
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${snapshot.data}'),
                          Text('Current:${counterCubit.current}'),
                          Text('Next:${counterCubit.next}'),
                        ],
                      ),
                    );
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  counterCubit.add();
                },
                child: Text('tambah'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

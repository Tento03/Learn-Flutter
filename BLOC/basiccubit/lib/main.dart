import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void add() {
    emit(state + 1);
  }

  void min() {
    emit(state - 1);
  }
}

class MyApp extends StatelessWidget {
  CounterCubit counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Basic Cubit')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder(
                stream: counterCubit.stream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: Text('Loading'));
                  } else {
                    return Center(child: Text('${snapshot.data}'));
                  }
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      counterCubit.min();
                    },
                    child: Icon(Icons.minimize),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      counterCubit.add();
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

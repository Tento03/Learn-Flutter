import 'package:blockbuilderr/counter_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CounterController counterController = CounterController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              BlocBuilder(
                bloc: counterController,
                buildWhen: (previous, current) {
                  if (previous == 5) {
                    return true;
                  } else {
                    return false;
                  }
                },
                builder: (context, state) {
                  return Text("$state");
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      counterController.sum();
                    },
                    child: Text('Sum'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      counterController.min();
                    },
                    child: Text('Min'),
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

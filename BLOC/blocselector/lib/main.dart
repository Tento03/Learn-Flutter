import 'package:blocselector/counter_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterController(),
        child: First(),
      ),
    );
  }
}

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            BlocSelector<CounterController, int, int>(
              selector: (state) => state,
              builder: (context, state) {
                return Text("$state");
              },
            ),
            BlocSelector<CounterController, int, String>(
              selector: (state) => state % 2 == 0 ? 'even' : 'odd',
              builder: (context, state) {
                return Text(state);
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CounterController>().sum();
              },
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}

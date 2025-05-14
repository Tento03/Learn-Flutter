import 'package:blocaccess/counter_controller.dart';
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
    final CounterController controller = context.watch<CounterController>();
    final isEven = context.select<CounterController, bool>(
      (value) => value.state % 2 == 0,
    );
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Counter:${controller.state}"),
            Text(isEven ? 'genap' : 'ganjil'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<CounterController>().sum();
              },
              child: Text('Inc'),
            ),
          ],
        ),
      ),
    );
  }
}

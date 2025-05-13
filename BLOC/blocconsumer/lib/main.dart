import 'package:blocconsumer/counter_controller.dart';
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
        create: (_) => CounterController(),
        child: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterController counterController =
        context.read<CounterController>();

    return Scaffold(
      appBar: AppBar(title: Text('Consumer')),
      body: Center(
        child: Column(
          children: [
            BlocConsumer(
              bloc: counterController,
              builder: (context, state) {
                return Text("$state");
              },
              listener: (context, state) {
                if (state == 5) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Reached 5')));
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                counterController.tambah();
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

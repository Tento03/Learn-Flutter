import 'package:blocprovider/counter_controller.dart';
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
        create: (_) {
          return CounterController();
        },
        child: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterController counterController =
        context.read<CounterController>();

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            BlocListener<CounterController, int>(
              listener: (context, state) {
                if (state == 5) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Stop 5')));
                }
              },
              child: SizedBox.shrink(),
            ),
            BlocBuilder<CounterController, int>(
              bloc: counterController,
              builder: (context, state) {
                return Center(child: Text('$state'));
              },
            ),
            ElevatedButton(
              onPressed: () {
                counterController.sum();
              },
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}

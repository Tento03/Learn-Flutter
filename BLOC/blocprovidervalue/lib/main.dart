import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterController counterController = CounterController();

    return MaterialApp(
      home: BlocProvider.value(value: counterController, child: FirstPage()),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterController counterController =
        context.read<CounterController>();

    return Scaffold(
      appBar: AppBar(title: Text('Bloc Provider value')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterController, int>(
              bloc: counterController,
              builder: (context, state) {
                return Text("$state", style: TextStyle(fontSize: 32));
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                counterController.sum();
              },
              child: Text('Add'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => BlocProvider.value(
                          value: counterController,
                          child: SecondPage(),
                        ),
                  ),
                );
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterController counterController =
        context.read<CounterController>();

    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterController, int>(
              bloc: counterController,
              builder: (context, state) {
                return Text('Second: $state', style: TextStyle(fontSize: 32));
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                counterController.min();
              },
              child: Text('Min'),
            ),
          ],
        ),
      ),
    );
  }
}

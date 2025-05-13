// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_controller.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(create: (_) => CounterController(), child: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterController = context.read<CounterController>();

    return Scaffold(
      appBar: AppBar(title: Text('App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocListener<CounterController, int>(
              listener: (context, state) {
                if (state == 5) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('You have reached 5')));
                }
              },
              child: SizedBox.shrink(), // tidak perlu membangun UI
            ),
            BlocBuilder<CounterController, int>(
              builder: (context, state) {
                return Text('$state', style: TextStyle(fontSize: 40));
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => counterController.sum(),
                  child: Text('Sum'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => counterController.min(),
                  child: Text('Min'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

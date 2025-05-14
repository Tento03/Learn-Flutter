import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_controller.dart';
import 'counter_repository.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => CounterRepository(),
      child: BlocProvider(
        create:
            (context) => CounterController(context.read<CounterRepository>()),
        child: MaterialApp(home: First()),
      ),
    );
  }
}

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterController controller = context.read<CounterController>();

    return Scaffold(
      appBar: AppBar(title: Text('First Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterController, int>(
              builder: (context, state) {
                return Text("$state", style: TextStyle(fontSize: 30));
              },
            ),
            ElevatedButton(
              onPressed: () {
                controller.sum();
              },
              child: Text('Inc'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => BlocProvider.value(
                          value: controller,
                          child: Second(),
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

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterController controller = context.read<CounterController>();

    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterController, int>(
              builder: (context, state) {
                return Text("Second: $state", style: TextStyle(fontSize: 30));
              },
            ),
            ElevatedButton(
              onPressed: () {
                controller.sum();
              },
              child: Text('Inc Again'),
            ),
          ],
        ),
      ),
    );
  }
}

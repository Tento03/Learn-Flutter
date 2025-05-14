import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multibloclistener/counter_controller.dart';

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
    final CounterController controller = context.read<CounterController>();

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            BlocBuilder(
              bloc: controller,
              builder: (context, state) {
                return Text("$state");
              },
            ),
            MultiBlocListener(
              listeners: [
                BlocListener<CounterController, int>(
                  bloc: controller,
                  listener: (context, state) {
                    if (state % 2 == 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Even'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                ),
                BlocListener<CounterController, int>(
                  bloc: controller,
                  listener: (context, state) {
                    if (state % 2 != 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Odd'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                ),
              ],
              child: Text(''),
            ),
            ElevatedButton(
              onPressed: () {
                controller.sum();
              },
              child: Text('inc'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiblocprovider/min_controller.dart';
import 'package:multiblocprovider/sum_controller.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SumController()),
          BlocProvider(create: (context) => MinController()),
        ],
        child: First(),
      ),
    );
  }
}

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    final SumController sumController = context.read<SumController>();
    final MinController minController = context.read<MinController>();

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            BlocBuilder(
              bloc: sumController,
              builder: (context, state) {
                return Text("$state");
              },
            ),
            BlocBuilder(
              bloc: minController,
              builder: (context, state) {
                return Text("$state");
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                sumController.sum();
              },
              child: Text('Inc'),
            ),
            ElevatedButton(
              onPressed: () {
                minController.min();
              },
              child: Text('Dec'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => MultiBlocProvider(
                          providers: [
                            BlocProvider.value(value: sumController),
                            BlocProvider.value(value: minController),
                          ],
                          child: Second(),
                        ),
                  ),
                );
              },
              child: Text('GO ADD'),
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
    final SumController sumController = context.watch<SumController>();
    final MinController minController = context.watch<MinController>();

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("${sumController.state}"),
            Text("${minController.state}"),
            ElevatedButton(
              onPressed: () {
                sumController.sum();
              },
              child: Text('add'),
            ),
            ElevatedButton(
              onPressed: () {
                minController.min();
              },
              child: Text('min'),
            ),
          ],
        ),
      ),
    );
  }
}

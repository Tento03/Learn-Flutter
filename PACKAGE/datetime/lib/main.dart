import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    final dateTime = DateTime.now();

    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(child: Text(faker.person.name()[0])),
              title: Text(faker.person.name()),
              subtitle: Text(
                DateFormat("dd MMMM yyyy hh mm ss").format(dateTime),
              ),
            );
          },
        ),
      ),
    );
  }
}

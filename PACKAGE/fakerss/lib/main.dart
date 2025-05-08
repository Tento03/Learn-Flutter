import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final faker = Faker();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Faker")),
        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            final name = faker.person.name();
            final email = faker.internet.email();
            return ListTile(
              leading: CircleAvatar(child: Text(name[0])),
              title: Text(name),
              subtitle: Text(email),
            );
          },
        ),
      ),
    );
  }
}

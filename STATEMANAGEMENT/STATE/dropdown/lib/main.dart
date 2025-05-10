import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: MyForm()));
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _key = GlobalKey<FormState>();
  String? selectedGender;

  void submit() {
    if (_key.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Success")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              label: Text("JK"),
              border: OutlineInputBorder(),
            ),
            value: selectedGender,
            items:
                ["Male", "Female"]
                    .map(
                      (gender) =>
                          DropdownMenuItem(value: gender, child: Text(gender)),
                    )
                    .toList(),
            onChanged: (value) {
              setState(() {
                selectedGender = value;
              });
            },
            validator: (value) {
              if (value == null) {
                return "choose";
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              submit();
            },
            child: Text("submit"),
          ),
        ],
      ),
    );
  }
}

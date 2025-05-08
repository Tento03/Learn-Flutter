import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final key = GlobalKey<FormState>();
  String data = "Loading";

  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  Future<void> putData() async {
    if (key.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Sukses")));
    }

    final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
    final response = await http.put(
      uri,
      headers: {"Content-Type": "application/json; charset=UTF-8"},
      body: json.encode({
        "title": titleController.text,
        "body": bodyController.text,
        "userId": "1",
      }),
    );
    if (response.statusCode == 200) {
      setState(() {
        final jsonFinal = json.decode(response.body);
        data = jsonFinal["body"].toString();
      });
    } else {
      setState(() {
        data = "failed ${response.statusCode}";
      });
    }
  }

  Future<void> patchData() async {
    if (key.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Sukses")));
    }

    final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
    final response = await http.patch(
      uri,
      headers: {"Content-Type": "application/json; charset=UTF-8"},
      body: json.encode({"body": bodyController.text, "userId": "1"}),
    );
    if (response.statusCode == 200) {
      setState(() {
        final jsonFinal = json.decode(response.body);
        data = jsonFinal["body"].toString();
      });
    } else {
      setState(() {
        data = "failed ${response.statusCode}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Put & Patch")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(data),
            SizedBox(height: 20),
            Form(
              key: key,
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      label: Text("Title"),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "dont empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: bodyController,
                    decoration: InputDecoration(
                      label: Text("Body"),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "dont empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          putData();
                        },
                        child: Text("Put"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          patchData();
                        },
                        child: Text("Patch"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

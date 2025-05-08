import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(MyApk());
}

class MyApk extends StatelessWidget {
  const MyApk({super.key});

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
  String data = "loading";
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final key = GlobalKey<FormState>();

  Future<void> postData() async {
    if (key.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Sukses")));
    }
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json; charset=UTF-8"},
      body: json.encode({
        "title": titleController.text,
        "body": bodyController.text,
        "userId": "1",
      }),
    );

    if (response.statusCode == 201) {
      final jsonFinal = json.decode(response.body);
      setState(() {
        data = "Body:${jsonFinal["body"]}";
      });
    } else {
      setState(() {
        data = "failed ${response.statusCode}";
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data),
            SizedBox(height: 20),
            Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("Title"),
                      border: OutlineInputBorder(),
                    ),
                    controller: titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Dont null";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("Body"),
                      border: OutlineInputBorder(),
                    ),
                    controller: bodyController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Dont null";
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      postData();
                    },
                    child: Text("Post"),
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

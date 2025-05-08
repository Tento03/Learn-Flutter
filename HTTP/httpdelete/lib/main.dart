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
  String result = "loading";

  Future<void> deleteData() async {
    final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
    final response = await http.delete(uri);

    if (response.statusCode == 200) {
      setState(() {
        result = "Delete Success: ${response.body}";
      });
    } else {
      setState(() {
        result = "Delete Failed : ${response.statusCode}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(result),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                deleteData();
              },
              child: Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
}

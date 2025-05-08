import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false, // Menghilangkan debug banner
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = "Loading...";

  @override
  void initState() {
    super.initState();
    fetchData(); // Ambil data otomatis saat halaman dibuka
  }

  // Fungsi untuk fetch data dari jsonplaceholder
  Future<void> fetchData() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        data = jsonData[0]['title'];
      });
    } else {
      setState(() {
        data = "Failed to load data: ${response.statusCode}";
      });
    }
  }

  // Fungsi untuk ambil data saat tombol ditekan
  Future<void> fetchUserData() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final firstUser = jsonData[1]["title"];
      setState(() {
        data = "$firstUser";
      });
    } else {
      setState(() {
        data = "Failed to load users: ${response.statusCode}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HTTP GET Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data, style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchUserData,
              child: Text("Get User Data"),
            ),
          ],
        ),
      ),
    );
  }
}

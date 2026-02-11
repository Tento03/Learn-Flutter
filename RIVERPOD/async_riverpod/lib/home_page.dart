import 'package:async_riverpod/ui/GetAllPage.dart';
import 'package:async_riverpod/ui/GetDetailPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GetAllPage()),
              ),
              child: Text("Get All"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GetDetailPage(id: 1)),
              ),
              child: Text("Get Detail"),
            ),
          ],
        ),
      ),
    );
  }
}

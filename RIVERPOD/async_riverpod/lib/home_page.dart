import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
              onPressed: () => context.push("/get-all"),
              child: Text("Get All"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => context.push("/detail/1"),
              child: Text("Get Detail"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => context.push("/create"),
              child: Text("Create"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("")),
        body: Center(
          child: AvatarGlow(
            child: CircleAvatar(
              radius: 40.0,
              backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
            ),
            glowColor: Colors.blue,
            duration: Duration(milliseconds: 2000),
            repeat: true,
            startDelay: Duration(milliseconds: 1000),
          ),
        ),
      ),
    );
  }
}

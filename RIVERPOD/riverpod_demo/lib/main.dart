import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/HomePage.dart';
import 'package:riverpod_demo/ThemePage.dart';

void main(List<String> args) {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Riverpod Demo',
      home: HomePage(),
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
    );
  }
}

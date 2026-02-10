import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateProvider<bool>((ref) => false);

class ThemePage extends ConsumerWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Theme Page")),
      body: Center(
        child: Column(
          children: [
            Text(isDark ? "Dark Mode" : "Light Mode "),
            ElevatedButton(
              onPressed: () {
                ref.read(themeProvider.notifier).state = !isDark;
              },
              child: Text('Change Theme'),
            ),
          ],
        ),
      ),
    );
  }
}

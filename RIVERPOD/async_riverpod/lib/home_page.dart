import 'package:async_riverpod/provider/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(postsProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Async Scaffold')),
      body: postsAsync.when(
        data: (data) => ListView.builder(
          itemBuilder: (context, index) {
            final post = data[index];
            return ListTile(title: Text(post.title), subtitle: Text(post.body));
          },
        ),
        error: (error, stackTrace) => Center(child: Text("Error:$error")),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

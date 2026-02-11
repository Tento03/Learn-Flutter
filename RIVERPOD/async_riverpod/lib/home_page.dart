import 'package:async_riverpod/provider/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postAsync = ref.watch(getPostsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Async Riverpod"),
        automaticallyImplyActions: false,
      ),
      body: postAsync.when(
        data: (data) => ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final post = data[index];
            return ListTile(title: Text(post.title), subtitle: Text(post.body));
          },
        ),
        error: (error, stackTrace) => Center(child: Text("error:$error")),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

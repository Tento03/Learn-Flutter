import 'package:async_riverpod/provider/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postAsync = ref.watch(postsProvider);

    return postAsync.when(
      data: (posts) => RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(postsProvider);
        },
        child: ListView.builder(
          itemBuilder: (context, index) {
            final post = posts[index];
            return ListTile(title: Text(post.title), subtitle: Text(post.body));
          },
        ),
      ),
      error: (error, stackTrace) => Center(child: Text("Error:$error")),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}

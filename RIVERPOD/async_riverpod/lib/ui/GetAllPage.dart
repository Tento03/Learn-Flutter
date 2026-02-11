import 'package:async_riverpod/provider/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetAllPage extends ConsumerWidget {
  const GetAllPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getPostAsync = ref.watch(getPostsProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Get All Page")),
      body: getPostAsync.when(
        data: (data) => ListView.builder(
          itemBuilder: (context, index) {
            final posts = data[index];
            return ListTile(
              title: Text(posts.title),
              subtitle: Text(posts.body),
            );
          },
        ),
        error: (error, stackTrace) => Center(child: Text("Error:$error")),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

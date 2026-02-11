import 'package:async_riverpod/provider/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetDetailPage extends ConsumerWidget {
  final int id;
  const GetDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postAsync = ref.watch(getDetailPostsProvider(id));

    return Scaffold(
      appBar: AppBar(title: Text("Get Detail Page")),
      body: postAsync.when(
        data: (data) => Center(
          child: Column(
            children: [Text("Title:${data.title}"), Text("Body:${data.body}")],
          ),
        ),
        error: (error, stackTrace) => Center(child: Text("Error:$error")),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

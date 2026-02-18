import 'package:async_riverpod/provider/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetDetailPage extends ConsumerWidget {
  final int id;
  const GetDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postAsync = ref.watch(getDetailPostsProvider(id));
    final deleteState = ref.watch(deletePostNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Get Detail Page")),
      body: postAsync.when(
        data: (data) => Center(
          child: Column(
            children: [
              Text("Title:${data.title}"),
              Text("Body:${data.body}"),
              ElevatedButton(
                onPressed: () => deleteState.isLoading
                    ? null
                    : () async {
                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Hapus data"),
                            content: Text("Yakin dek?"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: Text("Batal"),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: Text("Hapus"),
                              ),
                            ],
                          ),
                        );

                        if (confirm == true) {
                          await ref
                              .read(deletePostNotifierProvider.notifier)
                              .deletePost(data.id);

                          ref.invalidate(getPostsProvider);

                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        }
                      },
                child: deleteState.isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text("Delete"),
              ),
            ],
          ),
        ),
        error: (error, stackTrace) => Center(child: Text("Error:$error")),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

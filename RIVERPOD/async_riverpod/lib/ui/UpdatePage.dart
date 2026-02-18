import 'package:async_riverpod/provider/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UpdatePage extends ConsumerStatefulWidget {
  final int id;
  const UpdatePage({super.key, required this.id});

  @override
  ConsumerState<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends ConsumerState<UpdatePage> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      final post = await ref.read(getDetailPostsProvider(widget.id).future);
      titleController.text = post.title;
      bodyController.text = post.body;
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final updateState = ref.watch(postNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Update Post")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(
                labelText: "Body",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: updateState.isLoading
                  ? null
                  : () async {
                      await ref
                          .read(postNotifierProvider.notifier)
                          .updatePost(
                            widget.id,
                            titleController.text,
                            bodyController.text,
                          );

                      if (mounted) {
                        context.pop();
                      }
                    },
              child: updateState.isLoading
                  ? CircularProgressIndicator()
                  : Text("Update"),
            ),
            SizedBox(height: 20),

            updateState.when(
              data: (data) => SizedBox(),
              error: (error, stackTrace) => Center(child: Text("Error:$error")),
              loading: () => SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}

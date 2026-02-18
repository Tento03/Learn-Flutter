import 'package:async_riverpod/provider/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePage extends ConsumerStatefulWidget {
  const CreatePage({super.key});

  @override
  ConsumerState<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends ConsumerState<CreatePage> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postState = ref.watch(postNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Create Page")),
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
              maxLines: 3,
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: postState.isLoading
                  ? null
                  : () async {
                      await ref
                          .read(postNotifierProvider.notifier)
                          .createPost(
                            titleController.text,
                            bodyController.text,
                          );
                    },
              child: postState.isLoading
                  ? CircularProgressIndicator()
                  : Text("Create"),
            ),

            SizedBox(height: 20),

            postState.when(
              data: (data) => Text("Success"),
              error: (error, stackTrace) => Text("Error:$error"),
              loading: () => SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}

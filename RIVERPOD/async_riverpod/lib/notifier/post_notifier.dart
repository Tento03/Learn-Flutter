import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:http/http.dart' as http;

class PostNotifier extends StateNotifier<AsyncValue<void>> {
  PostNotifier() : super(AsyncData(null));

  Future<void> createPost(String title, String body) async {
    state = const AsyncLoading();

    try {
      final response = await http.post(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        body: jsonEncode({"title": title, "body": body, "userId": 1}),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 201) {
        state = AsyncData(null);
      } else {
        throw Exception("Gagal create");
      }
    } catch (e, s) {
      state = AsyncError(e, s);
    }
  }
}

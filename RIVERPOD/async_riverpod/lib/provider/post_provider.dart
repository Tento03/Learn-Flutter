import 'dart:convert';

import 'package:async_riverpod/model/post_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final postsProvider = FutureProvider<List<Post>>((ref) async {
  final response = await http.get(
    Uri.parse("https://jsonplaceholder.typicode.com/posts"),
  );

  if (response.statusCode == 200) {
    final List data = jsonDecode(response.body);
    return data.map((e) => Post.fromJson(e)).toList();
  } else {
    throw Exception("Gagal load post");
  }
});

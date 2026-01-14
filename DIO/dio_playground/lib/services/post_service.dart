import 'package:dio_playground/core/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:dio_playground/models/post.dart';

class PostService {
  final Dio _dio = DioClient.dio;

  Future<List<Post>> getPosts() async {
    try {
      final response = await _dio.get("/posts");

      final List data = response.data;

      return data.map((json) => Post.fromJson(json)).toList();
    } on DioException catch (e) {
      print("Dio error:$e");
      rethrow;
    }
  }
}

// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:api_call/features/posts/models/posts_data_ui_model.dart';
import 'package:http/http.dart' as http;

class PostsRepo {
  static Future<List<PostsDataUiModel>> fetchPosts() async {
    var client = http.Client();
    List<PostsDataUiModel> posts = [];

    try {
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        PostsDataUiModel post =
            PostsDataUiModel.fromMap(result[i] as Map<String, dynamic>);
        posts.add(post);
      }
      return (posts);
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  static Future<bool> addPost() async {
    var client = http.Client();

    try {
      var response = await client.post(
          Uri.parse('https://jsonplaceholder.typicode.com/posts'),
          body: jsonEncode(<String, String>{
            'title': 'Swikrit bhatta',
            'body': 'Flutter Api calls example',
            'userId': '4',
          }));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}

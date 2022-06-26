import 'dart:convert';

import 'package:getandpost/model.dart';
import 'package:http/http.dart';

class Getpost {
  String host = "https://jsonplaceholder.typicode.com/posts/1";

  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=utf-8',
  };
  Future<Post> getpost() async {
    Response response = await get(Uri.parse(host), headers: headers);
    if (response.statusCode == 200) {
      var data = Post.fromJson(jsonDecode(response.body));
      //print(data);
      return data;
    } else {
      throw Exception(
          'Failed to get post.${response.statusCode} with body ${jsonDecode(response.body.toString())}');
    }
  }
}

class SendPost {
  String host = "https://jsonplaceholder.typicode.com/posts";

  Future<Post> createPost(String title, String body) async {
    final response = await post(
      Uri.parse(host),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'title': title, 'body': body}),
    );
    if (response.statusCode == 201) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          'Failed to create post.${response.statusCode} with body ${jsonDecode(response.body.toString())}');
    }
  }
}

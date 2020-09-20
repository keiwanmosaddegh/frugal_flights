import 'dart:convert';

import 'package:frugal_flights/models/post.dart';
import 'package:http/http.dart';

class HttpService {
  final String postsUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<void> deletePost(int id) async {
    Response res = await delete("$postsUrl/$id");

    if(res.statusCode == 200) {
      print("Deleted!");
    }
  }

  Future<List<Post>> getPosts() async {
    Response res = await get(postsUrl);

    if(res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Post> posts = body.map((dynamic item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw "Can't get posts.";
    }

  }

}


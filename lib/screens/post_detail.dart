import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frugal_flights/models/post.dart';
import 'package:frugal_flights/services/http_service.dart';

class PostDetail extends StatelessWidget {
  final Post post;
  final HttpService httpService = HttpService();

  PostDetail({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () async {
          await httpService.deletePost(post.id);
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(12),
        child: Card(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("Title"),
                subtitle: Text(post.title),
              ),
              ListTile(
                title: Text("ID"),
                subtitle: Text(post.id.toString()),
              ),
              ListTile(
                title: Text("Body"),
                subtitle: Text(post.body),
              ),
              ListTile(
                title: Text("User ID"),
                subtitle: Text(post.userId.toString()),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

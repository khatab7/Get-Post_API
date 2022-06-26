/*class Post {
  int id;
  String title;
  String body;
  Post({required this.id, required this.title, required this.body});
  factory Post.fromjson(Map<String, dynamic> json) {
    return Post(id: json['id'], title: json['title'], body: json['body']);
  }
}*/
class Post {
  final dynamic id;
  final String? title;
  final String? body;

  Post({this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(id: json["id"], title: json["title"], body: json["body"]);
  }
}

import 'dart:convert';

import 'package:trilhapp/model/http/comments_http_model.dart';
import 'package:http/http.dart' as http;
import 'package:trilhapp/repositories/posts/comments_repository.dart';

class CommentsHttpRepository implements CommentsRepository {
  @override
  Future<List<CommentModel>> retornarComentarios(int postId) async {
    var response = await http.get(Uri.parse(
        "https://jsonplaceholder.typicode.com/posts/$postId/comments"));
    if (response.statusCode == 200) {
      var jsonComments = jsonDecode(response.body);
      var teste =
          (jsonComments as List).map((e) => CommentModel.fromJson(e)).toList();
      return teste;
    }
    return [];
  }
}

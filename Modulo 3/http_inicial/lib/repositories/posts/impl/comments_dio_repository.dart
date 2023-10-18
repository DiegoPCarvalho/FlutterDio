import 'package:trilhapp/model/http/comments_http_model.dart';
import 'package:trilhapp/repositories/jsonplaceholder_custon_dio.dart';
import 'package:trilhapp/repositories/posts/comments_repository.dart';

class CommentsDioRepository implements CommentsRepository {
  @override
  Future<List<CommentModel>> retornarComentarios(int postId) async {
    var jsonCuston = JsonPlaceholderCustonDio();
    var response = await jsonCuston.dio.get("/posts/$postId/comments");
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => CommentModel.fromJson(e))
          .toList();
    }
    return [];
  }
}

import 'package:trilhapp/model/http/comments_http_model.dart';

abstract class CommentsRepository {
  Future<List<CommentModel>> retornarComentarios(int postId);
}

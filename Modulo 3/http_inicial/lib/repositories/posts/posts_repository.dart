import 'package:trilhapp/model/http/posts_http_model.dart';

abstract class PostRepository {
  Future<List<PostModel>> getPosts();
}

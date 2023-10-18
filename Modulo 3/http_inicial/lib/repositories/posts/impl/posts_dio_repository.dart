import 'package:trilhapp/model/http/posts_http_model.dart';
import 'package:trilhapp/repositories/jsonplaceholder_custon_dio.dart';
import 'package:trilhapp/repositories/posts/posts_repository.dart';

class PostsDioRepository implements PostRepository {
  @override
  Future<List<PostModel>> getPosts() async {
    var jsonCuston = JsonPlaceholderCustonDio();
    var response = await jsonCuston.dio.get("/posts");
    if (response.statusCode == 200) {
      return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}

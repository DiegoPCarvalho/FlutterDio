import 'package:flutter/material.dart';
import 'package:trilhapp/model/http/posts_http_model.dart';
import 'package:trilhapp/pages/comments_page.dart';
import 'package:trilhapp/repositories/posts/impl/posts_dio_repository.dart';

import 'package:trilhapp/repositories/posts/posts_repository.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  late PostRepository postRepository;
  var posts = <PostModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    postRepository = PostsDioRepository();
    carregarDados();
  }

  void carregarDados() async {
    posts = await postRepository.getPosts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Posts",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (_, index) {
          var post = posts[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Card(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => CommentsPage(postId: post.id)));
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.title,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        post.body,
                        style: const TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:trilhapp/repositories/posts/comments_repository.dart';
import 'package:trilhapp/repositories/posts/impl/comments_dio_repository.dart';
import 'package:trilhapp/model/http/comments_http_model.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key, required this.postId});
  final int postId;

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  late CommentsRepository commentsRepository;
  var comments = <CommentModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    commentsRepository = CommentsDioRepository();
    carregarDados();
  }

  carregarDados() async {
    comments = await commentsRepository.retornarComentarios(widget.postId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Comentarios do ${widget.postId}",
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: comments.isEmpty
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (_, index) {
                    var comment = comments[index];
                    return Card(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            Text(comment.name.substring(0, 6)),
                            Text(comment.email.substring(0, 10)),
                          ],
                        ),
                        Text(comment.body)
                      ],
                    ));
                  })),
    ));
  }
}

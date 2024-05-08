import 'package:flutter/material.dart';
import 'package:flutter_veli_bacik1/202/service/comment_models.dart';
import 'package:flutter_veli_bacik1/202/service/post_service.dart';

class CommentsLearnView extends StatefulWidget {
  const CommentsLearnView({super.key, this.postId});
  final int? postId;

  @override
  State<CommentsLearnView> createState() => _CommentsLearnViewState();
}

class _CommentsLearnViewState extends State<CommentsLearnView> {
  late final IPostService postService;
  bool _isloading = false;
  List<CommentModel>? _commentsItem;

  @override
  void initState() {
    super.initState();
    postService = PostService();
    fetchItemWithId(widget.postId ?? 0);
  }

  void _changeLoading(bool value) {
    setState(() {
      _isloading = value;
    });
  }

  Future<void> fetchItemWithId(int postId) async {
    _changeLoading(true);
    _commentsItem = await postService.fetchRelatedCommentWithPostId(postId);
    _changeLoading(false);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _commentsItem?.length ?? 0,
        itemBuilder: (context, index) {
          return Card(
            child: Text(_commentsItem?[index].email ?? ""),
          );
        },
      ),
    );
  }
}

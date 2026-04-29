import 'package:blogify_flutter_main/domain/data_sources/remote/comments_data_source.dart';
import 'package:blogify_flutter_main/domain/entities/comment_entity.dart';
import 'package:flutter/cupertino.dart';

class GlobalMockCommentProvider extends ChangeNotifier {
  final CommentsDataSource _commentsDataSource;

  GlobalMockCommentProvider(this._commentsDataSource);

  List<CommentEntity> get allComments => _commentsDataSource.allComments;

  List<CommentEntity> _filteredComments = [];

  List<CommentEntity> get filteredComments => _filteredComments;

  void fetchCommentsByPostId(int id) {
    _filteredComments = _commentsDataSource.getCommentsByPostId(id);
    notifyListeners();
  }

  void addComment(CommentEntity comment) {
    allComments.add(comment);
    fetchCommentsByPostId(comment.postId);
  }
}

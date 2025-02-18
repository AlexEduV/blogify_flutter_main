import 'package:blogify_flutter_main/domain/entities/comment_entity.dart';
import 'package:flutter/cupertino.dart';

class GlobalMockCommentProvider extends ChangeNotifier {

  List<CommentEntity> _allComments = [
    const CommentEntity(postId: 1, content: 'Hey there', date: '02/16/25', userId: 1),
  ];
  List<CommentEntity> get allComments => _allComments;

  List<CommentEntity> _filteredComments = [];
  List<CommentEntity> get filteredComments => _filteredComments;

  void fetchCommentsByPostId(int postId) {
    _filteredComments = allComments.where((comment) => comment.postId == postId).toList();
    notifyListeners();
  }

  void addComment(CommentEntity comment) {
    _allComments.add(comment);
    fetchCommentsByPostId(comment.postId);
  }
  
}

import 'package:blogify_flutter_main/domain/entities/comment_entity.dart';
import 'package:blogify_flutter_main/domain/usecases/comments/get_all_comments_use_case.dart';
import 'package:blogify_flutter_main/domain/usecases/comments/get_comments_by_post_id_use_case.dart';
import 'package:flutter/cupertino.dart';

class CommentsPageProvider extends ChangeNotifier {
  final GetCommentsByPostIdUseCase _getCommentsByPostIdUseCase;
  final GetAllCommentsUseCase _getAllCommentsUseCase;

  CommentsPageProvider(this._getCommentsByPostIdUseCase, this._getAllCommentsUseCase);

  List<CommentEntity> get allComments => _getAllCommentsUseCase.call();

  List<CommentEntity> _filteredComments = [];

  List<CommentEntity> get filteredComments => _filteredComments;

  void fetchCommentsByPostId(int id) {
    _filteredComments = _getCommentsByPostIdUseCase.call(id);
    notifyListeners();
  }

  void addComment(CommentEntity comment) {
    allComments.add(comment);
    fetchCommentsByPostId(comment.postId);
  }
}

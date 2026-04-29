import '../entities/comment_entity.dart';

abstract class CommentsRepository {
  void init();

  List<CommentEntity> getCommentsByPostId(int id);

  List<CommentEntity> getAllComments();
}

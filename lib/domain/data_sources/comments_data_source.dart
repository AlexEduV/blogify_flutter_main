import 'package:blogify_flutter_main/domain/entities/comment_entity.dart';

abstract class CommentsDataSource {
  late List<CommentEntity> allComments;

  void init();

  List<CommentEntity> getCommentsByPostId(int id);
}

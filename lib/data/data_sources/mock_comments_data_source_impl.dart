import 'package:blogify_flutter_main/domain/data_sources/comments_data_source.dart';
import 'package:blogify_flutter_main/domain/entities/comment_entity.dart';

class MockCommentsDataSourceImpl implements CommentsDataSource {
  @override
  List<CommentEntity> allComments = [];

  @override
  void init() {
    allComments = [
      const CommentEntity(postId: 1, content: 'Hey there', date: '02/16/25', userId: 2),
      const CommentEntity(postId: 1, content: 'Hey there again', date: '02/16/25', userId: 2),
    ];
  }

  @override
  List<CommentEntity> getCommentsByPostId(int id) {
    return allComments
        .where((comment) => comment.postId == id)
        .toList(growable: false)
        .reversed
        .toList();
  }
}

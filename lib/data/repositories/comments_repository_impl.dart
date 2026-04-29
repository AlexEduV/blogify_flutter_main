import 'package:blogify_flutter_main/domain/entities/comment_entity.dart';
import 'package:blogify_flutter_main/domain/repositories/comments_repository.dart';

import '../../domain/data_sources/remote/comments_data_source.dart';

class CommentsRepositoryImpl implements CommentsRepository {
  final CommentsDataSource _commentsDataSource;

  CommentsRepositoryImpl(this._commentsDataSource);

  @override
  List<CommentEntity> getCommentsByPostId(int id) {
    return _commentsDataSource.getCommentsByPostId(id);
  }

  @override
  void init() {
    _commentsDataSource.init();
  }

  @override
  List<CommentEntity> getAllComments() {
    return _commentsDataSource.allComments;
  }
}

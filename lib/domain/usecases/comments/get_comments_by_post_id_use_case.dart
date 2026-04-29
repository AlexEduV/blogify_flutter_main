import 'package:blogify_flutter_main/domain/entities/comment_entity.dart';
import 'package:blogify_flutter_main/domain/repositories/comments_repository.dart';
import 'package:blogify_flutter_main/domain/usecases/usecase.dart';

class GetCommentsByPostIdUseCase implements UseCaseWithParams<int, List<CommentEntity>> {
  final CommentsRepository _commentsRepository;

  GetCommentsByPostIdUseCase(this._commentsRepository);

  @override
  List<CommentEntity> call(int id) {
    return _commentsRepository.getCommentsByPostId(id);
  }
}

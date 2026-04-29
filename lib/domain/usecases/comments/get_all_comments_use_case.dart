import 'package:blogify_flutter_main/domain/entities/comment_entity.dart';
import 'package:blogify_flutter_main/domain/repositories/comments_repository.dart';
import 'package:blogify_flutter_main/domain/usecases/usecase.dart';

class GetAllCommentsUseCase implements UseCaseNoParams<List<CommentEntity>> {
  final CommentsRepository _commentsRepository;

  GetAllCommentsUseCase(this._commentsRepository);

  @override
  List<CommentEntity> call() {
    return _commentsRepository.getAllComments();
  }
}

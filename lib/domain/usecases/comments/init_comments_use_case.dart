import 'package:blogify_flutter_main/domain/repositories/comments_repository.dart';
import 'package:blogify_flutter_main/domain/usecases/usecase.dart';

class InitCommentsUseCase implements UseCaseNoParams<void> {
  final CommentsRepository _commentsRepository;

  InitCommentsUseCase(this._commentsRepository);

  @override
  void call() {
    return _commentsRepository.init();
  }
}

import 'package:blogify_flutter_main/domain/repositories/posts_repository.dart';
import 'package:blogify_flutter_main/domain/usecases/usecase.dart';

class InitPostsUseCase implements UseCaseNoParams<Future<void>> {
  final PostsRepository _postsRepository;

  InitPostsUseCase(this._postsRepository);

  @override
  Future<void> call() {
    return _postsRepository.init();
  }
}

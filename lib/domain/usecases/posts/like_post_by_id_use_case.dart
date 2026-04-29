import 'package:blogify_flutter_main/domain/repositories/posts_repository.dart';
import 'package:blogify_flutter_main/domain/usecases/usecase.dart';

class LikePostByIdUseCase implements UseCaseWithParams<int, bool> {
  final PostsRepository _postsRepository;

  LikePostByIdUseCase(this._postsRepository);

  @override
  bool call(int id) {
    return _postsRepository.likePostById(id);
  }
}

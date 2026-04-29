import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:blogify_flutter_main/domain/repositories/posts_repository.dart';
import 'package:blogify_flutter_main/domain/usecases/usecase.dart';

class GetPostByIdUseCase implements UseCaseWithParams<int, PostEntity> {
  final PostsRepository _postsRepository;

  GetPostByIdUseCase(this._postsRepository);

  @override
  PostEntity call(int id) {
    return _postsRepository.getPostById(id);
  }
}

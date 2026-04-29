import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:blogify_flutter_main/domain/repositories/posts_repository.dart';
import 'package:blogify_flutter_main/domain/usecases/usecase.dart';

class GetAllPostsUseCase implements UseCaseNoParams<List<PostEntity>> {
  final PostsRepository _postsRepository;

  GetAllPostsUseCase(this._postsRepository);

  @override
  List<PostEntity> call() {
    return _postsRepository.getAllPosts();
  }
}

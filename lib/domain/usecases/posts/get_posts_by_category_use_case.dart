import 'package:blogify_flutter_main/common/enums/post_category.dart';
import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:blogify_flutter_main/domain/repositories/posts_repository.dart';
import 'package:blogify_flutter_main/domain/usecases/usecase.dart';

class GetPostsByCategoryUseCase implements UseCaseWithParams<PostCategory, List<PostEntity>> {
  final PostsRepository _postsRepository;

  GetPostsByCategoryUseCase(this._postsRepository);

  @override
  List<PostEntity> call(PostCategory category) {
    return _postsRepository.getPostsByCategory(category);
  }
}

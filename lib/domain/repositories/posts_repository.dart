import '../../common/enums/post_category.dart';
import '../entities/post_entity.dart';

abstract class PostsRepository {
  Future<void> init();

  PostEntity getPostById(int id);

  List<PostEntity> getPostsByCategory(PostCategory category);

  bool likePostById(int id);

  List<PostEntity> getAllPosts();
}

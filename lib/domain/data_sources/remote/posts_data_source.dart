import 'package:blogify_flutter_main/common/enums/post_category.dart';
import 'package:blogify_flutter_main/domain/entities/post_entity.dart';

abstract class PostsDataSource {
  Future<void> init();

  PostEntity getPostById(int id);

  List<PostEntity> getPostsByCategory(PostCategory category);

  bool likePostById(int id);

  late List<PostEntity> allPosts;
}

import 'package:blogify_flutter_main/domain/entities/post_entity.dart';

abstract class PostsDataSource {
  void init();

  PostEntity getPostById(int id);

  late List<PostEntity> allPosts;
}

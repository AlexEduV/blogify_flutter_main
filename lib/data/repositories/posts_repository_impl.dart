import 'package:blogify_flutter_main/common/enums/post_category.dart';
import 'package:blogify_flutter_main/domain/data_sources/remote/posts_data_source.dart';
import 'package:blogify_flutter_main/domain/entities/post_entity.dart';

import '../../domain/repositories/posts_repository.dart';

class PostsRepositoryImpl implements PostsRepository {
  final PostsDataSource _postsDataSource;

  PostsRepositoryImpl(this._postsDataSource);

  @override
  List<PostEntity> getAllPosts() {
    return _postsDataSource.allPosts;
  }

  @override
  PostEntity getPostById(int id) {
    return _postsDataSource.getPostById(id);
  }

  @override
  List<PostEntity> getPostsByCategory(PostCategory category) {
    return _postsDataSource.getPostsByCategory(category);
  }

  @override
  Future<void> init() {
    return _postsDataSource.init();
  }

  @override
  bool likePostById(int id) {
    return _postsDataSource.likePostById(id);
  }
}

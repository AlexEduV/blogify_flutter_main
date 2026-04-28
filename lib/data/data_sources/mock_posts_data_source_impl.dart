import 'dart:convert';

import 'package:blogify_flutter_main/domain/data_sources/posts_data_source.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';

import '../../common/enums/post_category.dart';
import '../../domain/entities/post_entity.dart';

class MockPostsDataSourceImpl implements PostsDataSource {
  @override
  List<PostEntity> allPosts = [];

  @override
  Future<void> init() async {
    final jsonString = await rootBundle.loadString(
      'assets/mocks/posts_mock_data.json',
    );
    final jsonDecoded = json.decode(jsonString) as List<Map<String, dynamic>>;
    final list = jsonDecoded.map((element) => PostEntity.fromJson(element)).toList();

    allPosts = list;
  }

  @override
  PostEntity getPostById(int id) {
    final entity = allPosts.firstWhereOrNull((post) => post.id == id);
    if (entity == null) {
      return PostEntity.empty();
    }

    return entity;
  }

  @override
  List<PostEntity> getPostsByCategory(PostCategory category) {
    return allPosts.where((post) => post.category == category).toList();
  }

  @override
  bool likePostById(int id) {
    final postIndex = allPosts.indexWhere((post) => post.id == id);
    if (postIndex == -1) {
      return false;
    }

    final updatedPost = allPosts[postIndex].copyWith(isLiked: !allPosts[postIndex].isLiked);
    allPosts[postIndex] = updatedPost;

    return true;
  }
}

import 'package:blogify_flutter_main/common/enums/post_category.dart';
import 'package:blogify_flutter_main/domain/data_sources/posts_data_source.dart';
import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';

import '../../common/enums/post_filter.dart';

class GlobalMockStorageProvider extends ChangeNotifier {
  final PostsDataSource _postsDataSource;

  GlobalMockStorageProvider(this._postsDataSource);

  List<PostEntity> _allPosts = [];

  List<PostEntity> get allPosts => _allPosts;

  List<PostEntity> _postsInCategory = [];

  List<PostEntity> get postsInCategory => _postsInCategory;

  List<PostEntity> _postsFiltered = [];

  List<PostEntity> get postsFiltered => _postsFiltered;

  void initStorage() {
    _allPosts = _postsDataSource.allPosts;

    _postsInCategory = _allPosts;
    _postsFiltered = _allPosts;

    loadAllInCategory(PostCategory.trending);

    notifyListeners();
  }

  void filter(String filter, String column) {
    if (filter.isEmpty) {
      _postsFiltered = _postsInCategory;
      notifyListeners();

      return;
    }

    if (column == PostFilter.title.label) {
      _postsFiltered = _postsInCategory
          .where((post) => post.title.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    } else if (column == PostFilter.author.label) {
      _postsFiltered = _postsInCategory
          .where((post) => post.author.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    } else {
      throw Exception('Unexpected column');
    }

    notifyListeners();
  }

  void loadAllInCategory(PostCategory category) {
    _postsInCategory = _allPosts.where((post) => post.category == category).toList();
    _postsFiltered = _postsInCategory;
    notifyListeners();
  }

  void likePost(int id) {
    // Find the post that matches the id
    final postIndex = _allPosts.indexWhere((post) => post.id == id);

    if (postIndex != -1) {
      final updatedPost = _allPosts[postIndex].copyWith(isLiked: !_allPosts[postIndex].isLiked);
      _allPosts[postIndex] = updatedPost;
      notifyListeners();
    }
  }

  PostEntity getPostById(int id) {
    return _postsDataSource.getPostById(id);
  }
}

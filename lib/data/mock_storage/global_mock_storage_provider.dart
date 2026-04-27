import 'package:blogify_flutter_main/common/enums/post_category.dart';
import 'package:blogify_flutter_main/domain/data_sources/posts_data_source.dart';
import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';

import '../../common/enums/post_filter.dart';

class GlobalMockStorageProvider extends ChangeNotifier {
  final PostsDataSource _postsDataSource;

  GlobalMockStorageProvider(this._postsDataSource);

  List<PostEntity> get allPosts => _postsDataSource.allPosts;

  List<PostEntity> _postsInCategory = [];

  List<PostEntity> get postsInCategory => _postsInCategory;

  List<PostEntity> _postsFiltered = [];

  List<PostEntity> get postsFiltered => _postsFiltered;

  void initStorage() {
    _postsInCategory = allPosts;
    _postsFiltered = allPosts;

    loadAllInCategory(PostCategory.trending);

    notifyListeners();
  }

  //todo: what is going on here?
  void filter(String searchValue, PostFilter type) {
    if (searchValue.isEmpty) {
      _postsFiltered = _postsInCategory;
      notifyListeners();

      return;
    }

    final isTitle = type == PostFilter.title;

    if (isTitle) {
      _postsFiltered = _postsInCategory
          .where((post) => post.title.toLowerCase().contains(searchValue.toLowerCase()))
          .toList();
    } else {
      _postsFiltered = _postsInCategory
          .where((post) => post.author.toLowerCase().contains(searchValue.toLowerCase()))
          .toList();
    }

    notifyListeners();
  }

  void loadAllInCategory(PostCategory category) {
    _postsInCategory = _postsDataSource.getPostsByCategory(category);
    _postsFiltered = _postsInCategory;
    notifyListeners();
  }

  void likePost(int id) {
    final isSuccessful = _postsDataSource.likePostById(id);
    if (isSuccessful) {
      notifyListeners();
    }
  }

  PostEntity getPostById(int id) {
    return _postsDataSource.getPostById(id);
  }
}

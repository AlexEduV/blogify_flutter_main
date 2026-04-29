import 'package:blogify_flutter_main/common/enums/post_category.dart';
import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:blogify_flutter_main/domain/usecases/posts/get_all_posts_use_case.dart';
import 'package:blogify_flutter_main/domain/usecases/posts/get_post_by_id_use_case.dart';
import 'package:blogify_flutter_main/domain/usecases/posts/get_posts_by_category_use_case.dart';
import 'package:blogify_flutter_main/domain/usecases/posts/like_post_by_id_use_case.dart';
import 'package:flutter/material.dart';

import '../../../common/enums/post_filter.dart';

class GlobalMockStorageProvider extends ChangeNotifier {
  final GetAllPostsUseCase _getAllPostsUseCase;
  final GetPostsByCategoryUseCase _getPostsByCategoryUseCase;
  final LikePostByIdUseCase _likePostByIdUseCase;
  final GetPostByIdUseCase _getPostByIdUseCase;

  GlobalMockStorageProvider(this._getAllPostsUseCase, this._getPostsByCategoryUseCase,
      this._likePostByIdUseCase, this._getPostByIdUseCase);

  List<PostEntity> get allPosts => _getAllPostsUseCase.call();

  List<PostEntity> _postsInCategory = [];

  List<PostEntity> get postsInCategory => _postsInCategory;

  List<PostEntity> _postsFiltered = [];

  List<PostEntity> get postsFiltered => _postsFiltered;

  void initStorage() {
    loadAllInCategory(PostCategory.trending);

    notifyListeners();
  }

  void filter(String searchValue, PostFilter type) {
    if (searchValue.isEmpty) {
      _postsFiltered = _postsInCategory;
      notifyListeners();

      return;
    }

    final isTitle = type == PostFilter.title;

    _postsFiltered = _postsInCategory.where((post) {
      final searchedField = isTitle ? post.title : post.author;
      return searchedField.toLowerCase().contains(searchValue.toLowerCase());
    }).toList();

    notifyListeners();
  }

  void loadAllInCategory(PostCategory category) {
    _postsInCategory = _getPostsByCategoryUseCase.call(category);
    _postsFiltered = _postsInCategory;
    notifyListeners();
  }

  void likePost(int id) {
    final isSuccessful = _likePostByIdUseCase.call(id);
    if (isSuccessful) {
      notifyListeners();
    }
  }

  PostEntity getPostById(int id) {
    return _getPostByIdUseCase.call(id);
  }
}

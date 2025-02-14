import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';

class GlobalMockStorageProvider extends ChangeNotifier {

  List<PostEntity> _posts = [];
  List<PostEntity> get posts => _posts;

  void load() {

    _posts = [
      PostEntity(
        id: 1,
        title: 'Where Web 3\nis Going to?',
        author: 'Josh Brian',
        daysAgoPublished: 1,
        minToRead: 5,
      ),
      PostEntity(
        id: 2,
        title: 'Good Listeners Urgently Required',
        author: 'Jay Fitzgerald',
        daysAgoPublished: 2,
        minToRead: 15,
      ),
      PostEntity(
        id: 3,
        title: 'Being a Better Creative Director',
        author: 'Britton Stipetic',
        daysAgoPublished: 6,
        minToRead: 10,
      ),
    ];

    notifyListeners();
  }

  void likePost(int id) {
    // Find the post that matches the id
    final postIndex = _posts.indexWhere((post) => post.id == id);

    // If the post exists, update it
    if (postIndex != -1) {
      // Create a new PostEntity with the updated 'isLiked' status
      final updatedPost = _posts[postIndex].copyWith(isLiked: !_posts[postIndex].isLiked);

      // Replace the old post with the updated one in the list
      _posts[postIndex] = updatedPost;

      // Notify listeners so that UI can be updated
      notifyListeners();
    }

  }

}

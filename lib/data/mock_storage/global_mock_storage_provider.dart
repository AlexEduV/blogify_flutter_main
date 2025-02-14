import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';

class GlobalMockStorageProvider extends ChangeNotifier {

  List<PostEntity> _postList = [];
  List<PostEntity> get posts => _postList;

  void load() {

    _postList = [
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

}
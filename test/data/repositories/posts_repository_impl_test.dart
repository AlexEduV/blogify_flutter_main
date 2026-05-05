import 'package:blogify_flutter_main/common/enums/post_category.dart';
import 'package:blogify_flutter_main/data/repositories/posts_repository_impl.dart';
import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../domain/data_sources/remote/posts_data_source_test.dart'; // Update with actual path

void main() {
  group('PostsRepositoryImpl', () {
    late MockPostsDataSource mockDataSource;
    late PostsRepositoryImpl repository;

    setUp(() {
      mockDataSource = MockPostsDataSource();
      repository = PostsRepositoryImpl(mockDataSource);
    });

    test('getPostById delegates to data source', () {
      final post = const PostEntity(
        id: 2,
        title: 'Another Post',
        author: 'Author2',
        daysAgoPublished: 2,
        minToRead: 10,
        url: 'url2',
      );
      when(() => mockDataSource.getPostById(2)).thenReturn(post);

      final result = repository.getPostById(2);

      expect(result, post);
      verify(() => mockDataSource.getPostById(2)).called(1);
    });

    test('getPostsByCategory delegates to data source', () {
      final posts = [
        const PostEntity(
          id: 3,
          title: 'Design Post',
          author: 'Designer',
          daysAgoPublished: 3,
          minToRead: 7,
          url: 'url3',
          category: PostCategory.design,
        ),
      ];
      when(() => mockDataSource.getPostsByCategory(PostCategory.design)).thenReturn(posts);

      final result = repository.getPostsByCategory(PostCategory.design);

      expect(result, posts);
      verify(() => mockDataSource.getPostsByCategory(PostCategory.design)).called(1);
    });

    test('init delegates to data source', () async {
      when(() => mockDataSource.init()).thenAnswer((_) async {});

      await repository.init();

      verify(() => mockDataSource.init()).called(1);
    });

    test('likePostById delegates to data source', () {
      when(() => mockDataSource.likePostById(1)).thenReturn(true);

      final result = repository.likePostById(1);

      expect(result, isTrue);
      verify(() => mockDataSource.likePostById(1)).called(1);
    });
  });
}

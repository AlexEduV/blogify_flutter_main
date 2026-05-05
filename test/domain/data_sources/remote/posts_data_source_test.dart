import 'package:blogify_flutter_main/common/enums/post_category.dart';
import 'package:blogify_flutter_main/domain/data_sources/remote/posts_data_source.dart';
import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPostsDataSource extends Mock implements PostsDataSource {}

void main() {
  group('PostsDataSource', () {
    late MockPostsDataSource mockDataSource;

    setUp(() {
      mockDataSource = MockPostsDataSource();
    });

    test('init can be called', () async {
      when(() => mockDataSource.init()).thenAnswer((_) async {});

      await mockDataSource.init();

      verify(() => mockDataSource.init()).called(1);
    });

    test('getPostById returns expected post', () {
      final post = const PostEntity(
        id: 1,
        title: 'Test Post',
        author: 'Author',
        daysAgoPublished: 1,
        minToRead: 5,
        url: 'url1',
      );
      when(() => mockDataSource.getPostById(1)).thenReturn(post);

      final result = mockDataSource.getPostById(1);

      expect(result, post);
      verify(() => mockDataSource.getPostById(1)).called(1);
    });

    test('getPostsByCategory returns expected posts', () {
      final posts = [
        const PostEntity(
          id: 2,
          title: 'Design Post',
          author: 'Designer',
          daysAgoPublished: 2,
          minToRead: 10,
          url: 'url2',
          category: PostCategory.design,
        ),
      ];
      when(() => mockDataSource.getPostsByCategory(PostCategory.design)).thenReturn(posts);

      final result = mockDataSource.getPostsByCategory(PostCategory.design);

      expect(result, posts);
      verify(() => mockDataSource.getPostsByCategory(PostCategory.design)).called(1);
    });

    test('likePostById returns true', () {
      when(() => mockDataSource.likePostById(1)).thenReturn(true);

      final result = mockDataSource.likePostById(1);

      expect(result, isTrue);
      verify(() => mockDataSource.likePostById(1)).called(1);
    });
  });
}

import 'package:blogify_flutter_main/common/enums/post_category.dart';
import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:blogify_flutter_main/domain/repositories/posts_repository.dart'; // Update with actual path
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPostsRepository extends Mock implements PostsRepository {}

void main() {
  group('PostsRepository', () {
    late MockPostsRepository mockRepository;

    setUp(() {
      mockRepository = MockPostsRepository();
    });

    test('init can be called', () async {
      when(() => mockRepository.init()).thenAnswer((_) async {});

      await mockRepository.init();

      verify(() => mockRepository.init()).called(1);
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
      when(() => mockRepository.getPostById(1)).thenReturn(post);

      final result = mockRepository.getPostById(1);

      expect(result, post);
      verify(() => mockRepository.getPostById(1)).called(1);
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
      when(() => mockRepository.getPostsByCategory(PostCategory.design)).thenReturn(posts);

      final result = mockRepository.getPostsByCategory(PostCategory.design);

      expect(result, posts);
      verify(() => mockRepository.getPostsByCategory(PostCategory.design)).called(1);
    });

    test('likePostById returns true', () {
      when(() => mockRepository.likePostById(1)).thenReturn(true);

      final result = mockRepository.likePostById(1);

      expect(result, isTrue);
      verify(() => mockRepository.likePostById(1)).called(1);
    });

    test('getAllPosts returns expected posts', () {
      final posts = [
        const PostEntity(
          id: 3,
          title: 'Tech Post',
          author: 'Techie',
          daysAgoPublished: 3,
          minToRead: 7,
          url: 'url3',
          category: PostCategory.tech,
        ),
      ];
      when(() => mockRepository.getAllPosts()).thenReturn(posts);

      final result = mockRepository.getAllPosts();

      expect(result, posts);
      verify(() => mockRepository.getAllPosts()).called(1);
    });
  });
}

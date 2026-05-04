import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:blogify_flutter_main/domain/repositories/posts_repository.dart';
import 'package:blogify_flutter_main/domain/usecases/posts/get_all_posts_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPostsRepository extends Mock implements PostsRepository {}

void main() {
  group('GetAllPostsUseCase', () {
    late MockPostsRepository mockRepository;
    late GetAllPostsUseCase useCase;

    setUp(() {
      mockRepository = MockPostsRepository();
      useCase = GetAllPostsUseCase(mockRepository);
    });

    test('calls getAllPosts on repository and returns the result', () {
      // Arrange
      final posts = [
        const PostEntity(
          id: 1,
          title: 'Post 1',
          author: 'Author 1',
          daysAgoPublished: 1,
          minToRead: 5,
          url: 'url1',
        ),
        const PostEntity(
          id: 2,
          title: 'Post 2',
          author: 'Author 2',
          daysAgoPublished: 2,
          minToRead: 10,
          url: 'url2',
        ),
      ];
      when(() => mockRepository.getAllPosts()).thenReturn(posts);

      // Act
      final result = useCase();

      // Assert
      expect(result, posts);
      verify(() => mockRepository.getAllPosts()).called(1);
    });

    test('returns empty list if repository returns empty', () {
      // Arrange
      when(() => mockRepository.getAllPosts()).thenReturn([]);

      // Act
      final result = useCase();

      // Assert
      expect(result, isEmpty);
      verify(() => mockRepository.getAllPosts()).called(1);
    });
  });
}

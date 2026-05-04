import 'package:blogify_flutter_main/common/enums/post_category.dart';
import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:blogify_flutter_main/domain/usecases/posts/get_posts_by_category_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'get_all_posts_use_case_test.dart';

void main() {
  group('GetPostsByCategoryUseCase', () {
    late MockPostsRepository mockRepository;
    late GetPostsByCategoryUseCase useCase;

    setUp(() {
      mockRepository = MockPostsRepository();
      useCase = GetPostsByCategoryUseCase(mockRepository);
    });

    test('calls getPostsByCategory on repository and returns the result', () {
      // Arrange
      final posts = [
        const PostEntity(
          id: 1,
          title: 'Design Post',
          author: 'Author 1',
          daysAgoPublished: 1,
          minToRead: 5,
          url: 'url1',
          category: PostCategory.design,
        ),
        const PostEntity(
          id: 2,
          title: 'Another Design Post',
          author: 'Author 2',
          daysAgoPublished: 2,
          minToRead: 10,
          url: 'url2',
          category: PostCategory.design,
        ),
      ];
      when(() => mockRepository.getPostsByCategory(PostCategory.design)).thenReturn(posts);

      // Act
      final result = useCase(PostCategory.design);

      // Assert
      expect(result, posts);
      verify(() => mockRepository.getPostsByCategory(PostCategory.design)).called(1);
    });

    test('returns empty list if repository returns empty', () {
      // Arrange
      when(() => mockRepository.getPostsByCategory(PostCategory.tech)).thenReturn([]);

      // Act
      final result = useCase(PostCategory.tech);

      // Assert
      expect(result, isEmpty);
      verify(() => mockRepository.getPostsByCategory(PostCategory.tech)).called(1);
    });
  });
}

import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:blogify_flutter_main/domain/usecases/posts/get_post_by_id_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'get_all_posts_use_case_test.dart';

void main() {
  group('GetPostByIdUseCase', () {
    late MockPostsRepository mockRepository;
    late GetPostByIdUseCase useCase;

    setUp(() {
      mockRepository = MockPostsRepository();
      useCase = GetPostByIdUseCase(mockRepository);
    });

    test('calls getPostById on repository and returns the result', () {
      // Arrange
      final post = const PostEntity(
        id: 1,
        title: 'Post 1',
        author: 'Author 1',
        daysAgoPublished: 1,
        minToRead: 5,
        url: 'url1',
      );
      when(() => mockRepository.getPostById(1)).thenReturn(post);

      // Act
      final result = useCase(1);

      // Assert
      expect(result, post);
      verify(() => mockRepository.getPostById(1)).called(1);
    });
  });
}

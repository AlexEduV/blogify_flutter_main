import 'package:blogify_flutter_main/domain/usecases/posts/like_post_by_id_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'get_all_posts_use_case_test.dart';

void main() {
  group('LikePostByIdUseCase', () {
    late MockPostsRepository mockRepository;
    late LikePostByIdUseCase useCase;

    setUp(() {
      mockRepository = MockPostsRepository();
      useCase = LikePostByIdUseCase(mockRepository);
    });

    test('calls likePostById on repository and returns true', () {
      // Arrange
      when(() => mockRepository.likePostById(1)).thenReturn(true);

      // Act
      final result = useCase(1);

      // Assert
      expect(result, isTrue);
      verify(() => mockRepository.likePostById(1)).called(1);
    });

    test('calls likePostById on repository and returns false', () {
      // Arrange
      when(() => mockRepository.likePostById(2)).thenReturn(false);

      // Act
      final result = useCase(2);

      // Assert
      expect(result, isFalse);
      verify(() => mockRepository.likePostById(2)).called(1);
    });
  });
}

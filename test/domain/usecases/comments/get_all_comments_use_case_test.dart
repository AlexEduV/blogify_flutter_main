import 'package:blogify_flutter_main/domain/entities/comment_entity.dart';
import 'package:blogify_flutter_main/domain/repositories/comments_repository.dart';
import 'package:blogify_flutter_main/domain/usecases/comments/get_all_comments_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCommentsRepository extends Mock implements CommentsRepository {}

void main() {
  group('GetAllCommentsUseCase', () {
    test('returns all comments from repository', () {
      final mockRepository = MockCommentsRepository();
      final expectedComments = [
        const CommentEntity(postId: 1, content: 'Comment 1', date: '2024-01-01', userId: 10),
        const CommentEntity(postId: 2, content: 'Comment 2', date: '2024-01-02', userId: 20),
      ];

      when(() => mockRepository.getAllComments()).thenReturn(expectedComments);

      final useCase = GetAllCommentsUseCase(mockRepository);

      final result = useCase();

      expect(result, expectedComments);
    });

    test('returns empty list if repository returns empty', () {
      final mockRepository = MockCommentsRepository();
      when(() => mockRepository.getAllComments()).thenReturn([]);

      final useCase = GetAllCommentsUseCase(mockRepository);

      final result = useCase();

      expect(result, isEmpty);
    });
  });
}

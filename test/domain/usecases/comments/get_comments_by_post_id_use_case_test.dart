import 'package:blogify_flutter_main/domain/entities/comment_entity.dart';
import 'package:blogify_flutter_main/domain/usecases/comments/get_comments_by_post_id_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'get_all_comments_use_case_test.dart';

void main() {
  group('GetCommentsByPostIdUseCase', () {
    test('returns comments for given post id', () {
      final mockRepository = MockCommentsRepository();
      final expectedComments = [
        const CommentEntity(postId: 1, content: 'Comment 1', date: '2024-01-01', userId: 10),
        const CommentEntity(postId: 1, content: 'Comment 2', date: '2024-01-02', userId: 20),
      ];
      when(() => mockRepository.getCommentsByPostId(1)).thenReturn(expectedComments);

      final useCase = GetCommentsByPostIdUseCase(mockRepository);

      final result = useCase(1);

      expect(result, expectedComments);
    });

    test('returns empty list if no comments for post id', () {
      final mockRepository = MockCommentsRepository();
      when(() => mockRepository.getCommentsByPostId(42)).thenReturn([]);

      final useCase = GetCommentsByPostIdUseCase(mockRepository);

      final result = useCase(42);

      expect(result, isEmpty);
    });
  });
}

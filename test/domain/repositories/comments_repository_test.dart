import 'package:blogify_flutter_main/domain/entities/comment_entity.dart';
import 'package:blogify_flutter_main/domain/repositories/comments_repository.dart'; // Update with actual path
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCommentsRepository extends Mock implements CommentsRepository {}

void main() {
  group('CommentsRepository', () {
    late MockCommentsRepository mockRepository;

    setUp(() {
      mockRepository = MockCommentsRepository();
    });

    test('init can be called', () {
      when(() => mockRepository.init()).thenReturn(null);

      mockRepository.init();

      verify(() => mockRepository.init()).called(1);
    });

    test('getCommentsByPostId returns expected comments', () {
      final comments = [
        const CommentEntity(postId: 1, content: 'A', date: '2024-01-01', userId: 10),
        const CommentEntity(postId: 1, content: 'B', date: '2024-01-02', userId: 20),
      ];
      when(() => mockRepository.getCommentsByPostId(1)).thenReturn(comments);

      final result = mockRepository.getCommentsByPostId(1);

      expect(result, comments);
      verify(() => mockRepository.getCommentsByPostId(1)).called(1);
    });

    test('getAllComments returns expected comments', () {
      final comments = [
        const CommentEntity(postId: 1, content: 'A', date: '2024-01-01', userId: 10),
        const CommentEntity(postId: 2, content: 'B', date: '2024-01-02', userId: 20),
      ];
      when(() => mockRepository.getAllComments()).thenReturn(comments);

      final result = mockRepository.getAllComments();

      expect(result, comments);
      verify(() => mockRepository.getAllComments()).called(1);
    });
  });
}

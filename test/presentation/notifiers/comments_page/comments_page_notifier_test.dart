import 'package:blogify_flutter_main/domain/entities/comment_entity.dart';
import 'package:blogify_flutter_main/domain/usecases/comments/get_all_comments_use_case.dart';
import 'package:blogify_flutter_main/domain/usecases/comments/get_comments_by_post_id_use_case.dart';
import 'package:blogify_flutter_main/presentation/notifiers/comments_page/comments_page_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetAllCommentsUseCase extends Mock implements GetAllCommentsUseCase {}

class MockGetCommentsByPostIdUseCase extends Mock implements GetCommentsByPostIdUseCase {}

void main() {
  group('CommentsPageProvider', () {
    late MockGetAllCommentsUseCase mockAllCommentsUseCase;
    late MockGetCommentsByPostIdUseCase mockByPostIdUseCase;
    late CommentsPageNotifier provider;

    setUp(() {
      mockAllCommentsUseCase = MockGetAllCommentsUseCase();
      mockByPostIdUseCase = MockGetCommentsByPostIdUseCase();
      provider = CommentsPageNotifier(mockByPostIdUseCase, mockAllCommentsUseCase);
    });

    test('allComments returns from GetAllCommentsUseCase', () {
      final comments = [
        const CommentEntity(postId: 1, content: 'A', date: '2024-01-01', userId: 10),
        const CommentEntity(postId: 2, content: 'B', date: '2024-01-02', userId: 20),
      ];
      when(() => mockAllCommentsUseCase.call()).thenReturn(comments);

      expect(provider.allComments, comments);
      verify(() => mockAllCommentsUseCase.call()).called(1);
    });

    test('fetchCommentsByPostId updates filteredComments and notifies listeners', () {
      final comments = [
        const CommentEntity(postId: 1, content: 'A', date: '2024-01-01', userId: 10),
      ];
      when(() => mockByPostIdUseCase.call(1)).thenReturn(comments);

      var notified = false;
      provider.addListener(() {
        notified = true;
      });

      provider.fetchCommentsByPostId(1);

      expect(provider.filteredComments, comments);
      expect(notified, true);
      verify(() => mockByPostIdUseCase.call(1)).called(1);
    });

    test('addComment adds comment to allComments and updates filteredComments', () {
      final initialComments = <CommentEntity>[];
      final newComment = const CommentEntity(
        postId: 1,
        content: 'New',
        date: '2024-01-03',
        userId: 30,
      );
      final updatedComments = [newComment];

      when(() => mockAllCommentsUseCase.call()).thenReturn(initialComments);
      when(() => mockByPostIdUseCase.call(1)).thenReturn(updatedComments);

      var notified = false;
      provider.addListener(() {
        notified = true;
      });

      provider.addComment(newComment);

      expect(
        provider.allComments,
        initialComments,
      ); // allComments is initialComments, but newComment is added
      expect(
        initialComments,
        contains(newComment),
      ); // newComment should be added to initialComments
      expect(provider.filteredComments, updatedComments);
      expect(notified, true);
      verify(() => mockByPostIdUseCase.call(1)).called(1);
    });
  });
}

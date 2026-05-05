import 'package:blogify_flutter_main/domain/data_sources/remote/comments_data_source.dart';
import 'package:blogify_flutter_main/domain/entities/comment_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCommentsDataSource extends Mock implements CommentsDataSource {}

void main() {
  group('CommentsDataSource', () {
    late MockCommentsDataSource mockDataSource;

    setUp(() {
      mockDataSource = MockCommentsDataSource();
    });

    test('init can be called', () {
      when(() => mockDataSource.init()).thenReturn(null);

      mockDataSource.init();

      verify(() => mockDataSource.init()).called(1);
    });

    test('getCommentsByPostId returns expected comments', () {
      final comments = [
        const CommentEntity(postId: 1, content: 'A', date: '2024-01-01', userId: 10),
        const CommentEntity(postId: 1, content: 'B', date: '2024-01-02', userId: 20),
      ];
      when(() => mockDataSource.getCommentsByPostId(1)).thenReturn(comments);

      final result = mockDataSource.getCommentsByPostId(1);

      expect(result, comments);
      verify(() => mockDataSource.getCommentsByPostId(1)).called(1);
    });
  });
}

import 'package:blogify_flutter_main/data/repositories/comments_repository_impl.dart';
import 'package:blogify_flutter_main/domain/entities/comment_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../domain/data_sources/remote/comments_data_source_test.dart'; // Update with actual path

void main() {
  group('CommentsRepositoryImpl', () {
    late MockCommentsDataSource mockDataSource;
    late CommentsRepositoryImpl repository;

    setUp(() {
      mockDataSource = MockCommentsDataSource();
      repository = CommentsRepositoryImpl(mockDataSource);
    });

    test('getCommentsByPostId delegates to data source', () {
      final comments = [
        const CommentEntity(postId: 1, content: 'A', date: '2024-01-01', userId: 10),
        const CommentEntity(postId: 1, content: 'B', date: '2024-01-02', userId: 20),
      ];
      when(() => mockDataSource.getCommentsByPostId(1)).thenReturn(comments);

      final result = repository.getCommentsByPostId(1);

      expect(result, comments);
      verify(() => mockDataSource.getCommentsByPostId(1)).called(1);
    });

    test('init delegates to data source', () {
      when(() => mockDataSource.init()).thenReturn(null);

      repository.init();

      verify(() => mockDataSource.init()).called(1);
    });
  });
}

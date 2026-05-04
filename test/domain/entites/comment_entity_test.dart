import 'package:blogify_flutter_main/domain/entities/comment_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CommentEntity', () {
    test('should assign all fields correctly', () {
      const comment = CommentEntity(
        postId: 1,
        content: 'Test comment',
        date: '2024-01-01',
        userId: 42,
      );

      expect(comment.postId, 1);
      expect(comment.content, 'Test comment');
      expect(comment.date, '2024-01-01');
      expect(comment.userId, 42);
    });

    test('should be immutable', () {
      const comment = CommentEntity(
        postId: 2,
        content: 'Immutable test',
        date: '2024-02-02',
        userId: 99,
      );

      // The following lines are commented out because they should not compile if uncommented,
      // demonstrating immutability. Uncommenting them should cause a compile-time error.
      // comment.postId = 3;
      // comment.content = 'Changed';
      // comment.date = '2024-03-03';
      // comment.userId = 100;

      expect(comment.postId, 2);
      expect(comment.content, 'Immutable test');
      expect(comment.date, '2024-02-02');
      expect(comment.userId, 99);
    });
  });
}

import 'package:blogify_flutter_main/common/enums/post_category.dart';
import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PostEntity', () {
    test('constructor assigns all fields correctly and uses defaults', () {
      const post = PostEntity(
        id: 1,
        title: 'Test Title',
        author: 'Author',
        daysAgoPublished: 2,
        minToRead: 5,
        url: 'test-url',
      );

      expect(post.id, 1);
      expect(post.title, 'Test Title');
      expect(post.author, 'Author');
      expect(post.daysAgoPublished, 2);
      expect(post.minToRead, 5);
      expect(post.url, 'test-url');
      expect(post.category, PostCategory.none);
      expect(post.isLiked, false);
      expect(post.imageSrc, '');
      expect(post.paragraphs, isEmpty);
    });

    test('constructor assigns all fields when provided', () {
      const post = PostEntity(
        id: 2,
        title: 'Full Post',
        author: 'Full Author',
        daysAgoPublished: 1,
        minToRead: 10,
        url: 'full-url',
        category: PostCategory.tech,
        isLiked: true,
        imageSrc: 'image.png',
        paragraphs: ['p1', 'p2'],
      );

      expect(post.category, PostCategory.tech);
      expect(post.isLiked, true);
      expect(post.imageSrc, 'image.png');
      expect(post.paragraphs, ['p1', 'p2']);
    });

    test('copyWith returns a new instance with updated fields', () {
      const post = PostEntity(
        id: 1,
        title: 'Original',
        author: 'Author',
        daysAgoPublished: 2,
        minToRead: 5,
        url: 'url',
      );

      final updated = post.copyWith(title: 'Updated', isLiked: true, paragraphs: ['new paragraph']);

      expect(updated.id, 1);
      expect(updated.title, 'Updated');
      expect(updated.isLiked, true);
      expect(updated.paragraphs, ['new paragraph']);
      // unchanged fields
      expect(updated.author, 'Author');
      expect(updated.url, 'url');
    });

    test('empty factory returns correct default values', () {
      final empty = PostEntity.empty();
      expect(empty.id, 0);
      expect(empty.title, 'Sample article');
      expect(empty.author, 'Unknown author');
      expect(empty.daysAgoPublished, 7);
      expect(empty.minToRead, 15);
      expect(empty.url, 'test-article');
      expect(empty.category, PostCategory.none);
      expect(empty.isLiked, false);
      expect(empty.imageSrc, '');
      expect(empty.paragraphs, isEmpty);
    });

    test('fromJson parses all fields correctly', () {
      final json = {
        'id': 10,
        'title': 'Json Title',
        'author': 'Json Author',
        'daysAgoPublished': 3,
        'minToRead': 7,
        'category': 'tech',
        'isLiked': true,
        'imageSrc': 'img.jpg',
        'paragraphs': ['a', 'b'],
        'url': 'json-url',
      };

      final post = PostEntity.fromJson(json);

      expect(post.id, 10);
      expect(post.title, 'Json Title');
      expect(post.author, 'Json Author');
      expect(post.daysAgoPublished, 3);
      expect(post.minToRead, 7);
      expect(post.category, PostCategory.tech);
      expect(post.isLiked, true);
      expect(post.imageSrc, 'img.jpg');
      expect(post.paragraphs, ['a', 'b']);
      expect(post.url, 'json-url');
    });

    test('fromJson handles missing optional fields', () {
      final json = {
        'id': 11,
        'title': 'Partial',
        'author': 'Partial Author',
        'daysAgoPublished': 1,
        'minToRead': 2,
        'category': 'none',
        // isLiked, imageSrc, paragraphs, url are missing
        'paragraphs': [],
        'url': 'partial-url',
      };

      final post = PostEntity.fromJson(json);

      expect(post.isLiked, false); // default
      expect(
        post.imageSrc,
        '',
      ); // will throw if not present, so you may want to handle this in your code
      expect(post.paragraphs, isEmpty);
      expect(post.url, 'partial-url');
    });
  });
}

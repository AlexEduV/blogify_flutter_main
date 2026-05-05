import 'package:blogify_flutter_main/common/enums/post_category.dart';
import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:blogify_flutter_main/domain/usecases/posts/get_all_posts_use_case.dart';
import 'package:blogify_flutter_main/domain/usecases/posts/get_post_by_id_use_case.dart';
import 'package:blogify_flutter_main/domain/usecases/posts/get_posts_by_category_use_case.dart';
import 'package:blogify_flutter_main/domain/usecases/posts/like_post_by_id_use_case.dart';
import 'package:blogify_flutter_main/presentation/notifiers/posts/global_mock_storage_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetAllPostsUseCase extends Mock implements GetAllPostsUseCase {}

class MockGetPostsByCategoryUseCase extends Mock implements GetPostsByCategoryUseCase {}

class MockLikePostByIdUseCase extends Mock implements LikePostByIdUseCase {}

class MockGetPostByIdUseCase extends Mock implements GetPostByIdUseCase {}

void main() {
  group('GlobalMockStorageProvider', () {
    late MockGetAllPostsUseCase mockAllPostsUseCase;
    late MockGetPostsByCategoryUseCase mockByCategoryUseCase;
    late MockLikePostByIdUseCase mockLikePostUseCase;
    late MockGetPostByIdUseCase mockGetPostByIdUseCase;
    late GlobalMockStorageProvider provider;

    setUp(() {
      mockAllPostsUseCase = MockGetAllPostsUseCase();
      mockByCategoryUseCase = MockGetPostsByCategoryUseCase();
      mockLikePostUseCase = MockLikePostByIdUseCase();
      mockGetPostByIdUseCase = MockGetPostByIdUseCase();
      provider = GlobalMockStorageProvider(
        mockAllPostsUseCase,
        mockByCategoryUseCase,
        mockLikePostUseCase,
        mockGetPostByIdUseCase,
      );
    });

    test('allPosts returns from GetAllPostsUseCase', () {
      final posts = [
        const PostEntity(
          id: 1,
          title: 'Test Post',
          author: 'Author',
          daysAgoPublished: 1,
          minToRead: 5,
          url: 'url1',
        ),
      ];
      when(() => mockAllPostsUseCase.call()).thenReturn(posts);

      expect(provider.allPosts, posts);
      verify(() => mockAllPostsUseCase.call()).called(1);
    });

    test('loadAllInCategory updates postsInCategory and postsFiltered, notifies listeners', () {
      final posts = [
        const PostEntity(
          id: 2,
          title: 'Design Post',
          author: 'Designer',
          daysAgoPublished: 2,
          minToRead: 10,
          url: 'url2',
          category: PostCategory.design,
        ),
      ];
      when(() => mockByCategoryUseCase.call(PostCategory.design)).thenReturn(posts);

      var notified = false;
      provider.addListener(() {
        notified = true;
      });

      provider.loadAllInCategory(PostCategory.design);

      expect(provider.postsInCategory, posts);
      expect(provider.postsFiltered, posts);
      expect(notified, true);
      verify(() => mockByCategoryUseCase.call(PostCategory.design)).called(1);
    });

    test('likePost notifies listeners only if successful', () {
      when(() => mockLikePostUseCase.call(1)).thenReturn(true);

      var notified = false;
      provider.addListener(() {
        notified = true;
      });

      provider.likePost(1);

      expect(notified, true);
      verify(() => mockLikePostUseCase.call(1)).called(1);
    });

    test('likePost does not notify listeners if unsuccessful', () {
      when(() => mockLikePostUseCase.call(2)).thenReturn(false);

      var notified = false;
      provider.addListener(() {
        notified = true;
      });

      provider.likePost(2);

      expect(notified, false);
      verify(() => mockLikePostUseCase.call(2)).called(1);
    });

    test('getPostById delegates to GetPostByIdUseCase', () {
      final post = const PostEntity(
        id: 6,
        title: 'Unique Post',
        author: 'Unique Author',
        daysAgoPublished: 6,
        minToRead: 10,
        url: 'url6',
      );
      when(() => mockGetPostByIdUseCase.call(6)).thenReturn(post);

      final result = provider.getPostById(6);

      expect(result, post);
      verify(() => mockGetPostByIdUseCase.call(6)).called(1);
    });

    test('initStorage loads trending category and notifies listeners', () {
      final posts = [
        const PostEntity(
          id: 7,
          title: 'Trending Post',
          author: 'Trendsetter',
          daysAgoPublished: 7,
          minToRead: 11,
          url: 'url7',
          category: PostCategory.trending,
        ),
      ];
      when(() => mockByCategoryUseCase.call(PostCategory.trending)).thenReturn(posts);

      var notified = false;
      provider.addListener(() {
        notified = true;
      });

      provider.initStorage();

      expect(provider.postsInCategory, posts);
      expect(provider.postsFiltered, posts);
      expect(notified, true);
      verify(() => mockByCategoryUseCase.call(PostCategory.trending)).called(1);
    });
  });
}

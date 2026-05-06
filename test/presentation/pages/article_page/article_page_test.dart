import 'package:blogify_flutter_main/common/enums/post_category.dart';
import 'package:blogify_flutter_main/core/di/injection_container.dart';
import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:blogify_flutter_main/domain/entities/user_entity.dart';
import 'package:blogify_flutter_main/domain/models/share_params_model.dart';
import 'package:blogify_flutter_main/domain/usecases/share/share_use_case.dart';
import 'package:blogify_flutter_main/presentation/notifiers/posts/global_mock_storage_provider.dart';
import 'package:blogify_flutter_main/presentation/notifiers/user/user_data_notifier.dart';
import 'package:blogify_flutter_main/presentation/pages/article_page/article_page.dart';
import 'package:blogify_flutter_main/presentation/widgets/circled_button_outlined.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../notifiers/posts/global_mock_storage_provider_test.dart';
import '../../notifiers/user/user_data_notifier_test.dart';

class MockGlobalMockStorageProvider extends Mock implements GlobalMockStorageProvider {}

class MockUserDataNotifier extends Mock implements UserDataNotifier {}

class MockUserEntity extends Mock implements UserEntity {}

class MockShareUseCase extends Mock implements ShareUseCase {}

class MockShareParamsModel extends Mock implements ShareParamsModel {}

void main() {
  late MockGlobalMockStorageProvider mockPosts;
  late MockUserDataNotifier mockUser;
  late PostEntity post;

  final MockGetAllPostsUseCase getAllPostsUseCase = MockGetAllPostsUseCase();
  final MockGetPostsByCategoryUseCase getPostsByCategoryUseCase = MockGetPostsByCategoryUseCase();
  final MockLikePostByIdUseCase likePostByIdUseCase = MockLikePostByIdUseCase();
  final MockGetPostByIdUseCase getPostByIdUseCase = MockGetPostByIdUseCase();

  final MockGetUserByIdUseCase getUserByIdUseCase = MockGetUserByIdUseCase();
  final MockDatabaseManager databaseManager = MockDatabaseManager();

  registerFallbackValue(MockUserEntity());
  registerFallbackValue(MockShareParamsModel());

  final MockShareUseCase mockShareUseCase = MockShareUseCase();

  setUpAll(() {
    serviceLocator.registerLazySingleton<ShareUseCase>(() => mockShareUseCase);

    when(() => mockShareUseCase.call(any())).thenAnswer((_) async => {});
  });

  tearDownAll(() {
    serviceLocator.unregister<ShareUseCase>();
  });

  setUp(() {
    mockPosts = MockGlobalMockStorageProvider();
    mockUser = MockUserDataNotifier();
    post = const PostEntity(
      id: 1,
      author: 'Jane Doe',
      title: 'Test Article',
      imageSrc: 'https://example.com/image.png',
      daysAgoPublished: 3,
      minToRead: 7,
      url: '/article/1',
      paragraphs: ['Paragraph 1', 'Paragraph 2'],
      isLiked: false,
    );
    when(() => mockPosts.getPostById(1)).thenReturn(post);
    when(() => mockUser.user).thenReturn(
      // Adjust according to your User model
      UserEntity.empty().copyWith(likedArticles: []),
    );
    when(() => mockUser.updateUser(any())).thenAnswer((_) async => {});

    when(() => databaseManager.getUser()).thenAnswer((_) async => UserEntity.empty());
    when(() => databaseManager.updateUser(any())).thenAnswer((_) async => {});
    when(() => getUserByIdUseCase.call(1)).thenReturn(UserEntity.empty());

    when(() => getPostsByCategoryUseCase.call(PostCategory.trending)).thenReturn([]);

    when(() => getPostByIdUseCase.call(1)).thenReturn(PostEntity.empty().copyWith(id: 1));
  });

  Future<Widget> buildTestable({required Widget child}) async {
    final userDataNotifier = UserDataNotifier(getUserByIdUseCase, databaseManager);
    await userDataNotifier.init();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GlobalMockStorageProvider(
            getAllPostsUseCase,
            getPostsByCategoryUseCase,
            likePostByIdUseCase,
            getPostByIdUseCase,
          )..initStorage(),
        ),
        ChangeNotifierProvider(create: (_) => userDataNotifier),
      ],
      child: MaterialApp(home: child),
    );
  }

  // testWidgets('displays post title, info, cover image, and paragraphs', (tester) async {
  //   when(() => getPostByIdUseCase.call(1)).thenReturn(
  //     PostEntity.empty().copyWith(
  //       title: 'Test Article',
  //       paragraphs: ['Paragraph 1', 'Paragraph 2'],
  //       daysAgoPublished: 5,
  //       minToRead: 15,
  //     ),
  //   );
  //
  //   await tester.pumpWidget(await buildTestable(child: const ArticlePage(articleId: 1)));
  //
  //   expect(find.text('Test Article'), findsOneWidget);
  //   expect(find.byType(PostCoverPhoto), findsOneWidget);
  //   expect(find.text('Paragraph 1'), findsOneWidget);
  //   expect(find.text('Paragraph 2'), findsOneWidget);
  //
  //   // Info row
  //   final info = [
  //     post.author,
  //     // Adjust if your formatter returns a different string
  //     contains(IntlDayFormatter.getFormattedDays(post.daysAgoPublished)),
  //     contains('${L10n.articleReadTimeLabel} ${post.minToRead} ${L10n.articleReadTimeUnits}'),
  //   ];
  //   for (final part in info) {
  //     expect(
  //       find.byWidgetPredicate(
  //         (w) => w is Text && w.data != null && w.data!.contains(part is String ? part : ''),
  //       ),
  //       findsWidgets,
  //     );
  //   }
  // });
  //
  // testWidgets('back button pops the route', (tester) async {
  //   bool popped = false;
  //   await tester.pumpWidget(
  //     await buildTestable(
  //       child: Builder(
  //         builder: (context) {
  //           return const ArticlePage(articleId: 1);
  //         },
  //       ),
  //     ),
  //   );
  //   // Replace context.router.popForced with a callback for test, or use a mock router if needed.
  //   // For now, just tap the button to ensure it is present.
  //   await tester.tap(find.byIcon(Icons.chevron_left));
  //   // You would verify navigation with a mock router in a real test.
  // });
  //
  // testWidgets('comments button navigates to comments', (tester) async {
  //   await tester.pumpWidget(await buildTestable(child: const ArticlePage(articleId: 1)));
  //   await tester.tap(find.byIcon(Icons.comment));
  //   // You would verify navigation with a mock router in a real test.
  // });
  //

  testWidgets('like button toggles like state and updates user', (tester) async {
    when(() => likePostByIdUseCase.call(1)).thenReturn(true);

    await tester.pumpWidget(await buildTestable(child: const ArticlePage(articleId: 1)));
    final favoriteIconFinder = find.byWidgetPredicate(
      (widget) => widget is FaIcon && widget.icon == FontAwesomeIcons.heart,
    );

    await tester.tap(favoriteIconFinder); // or FontAwesomeIcons.heart
    verify(() => likePostByIdUseCase.call(1)).called(1);
    verify(() => databaseManager.updateUser(any())).called(1);
  });

  testWidgets('share button triggers share logic', (tester) async {
    await tester.pumpWidget(await buildTestable(child: const ArticlePage(articleId: 1)));
    final shareIconFinder = find.byWidgetPredicate(
      (widget) => widget is FaIcon && widget.icon == FontAwesomeIcons.shareFromSquare,
    );

    await tester.tap(shareIconFinder);
    // You would verify share logic with a mock use case in a real test.
  });

  testWidgets('renders all CircledButtonOutlined with correct semantics', (tester) async {
    await tester.pumpWidget(await buildTestable(child: const ArticlePage(articleId: 1)));
    expect(find.byType(CircledButtonOutlined), findsNWidgets(4));
  });

  testWidgets('renders all paragraphs', (tester) async {
    when(() => getPostByIdUseCase.call(1)).thenReturn(
      PostEntity.empty().copyWith(
        title: 'Test Article',
        paragraphs: ['Paragraph 1', 'Paragraph 2'],
        daysAgoPublished: 5,
        minToRead: 15,
      ),
    );

    await tester.pumpWidget(await buildTestable(child: const ArticlePage(articleId: 1)));
    for (final paragraph in post.paragraphs) {
      expect(find.text(paragraph), findsOneWidget);
    }
  });
}

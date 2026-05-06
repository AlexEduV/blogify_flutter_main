import 'package:blogify_flutter_main/common/enums/post_category.dart';
import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:blogify_flutter_main/domain/entities/user_entity.dart';
import 'package:blogify_flutter_main/presentation/notifiers/home_page/category_index_notifier.dart';
import 'package:blogify_flutter_main/presentation/notifiers/home_page/search_bar_notifier.dart';
import 'package:blogify_flutter_main/presentation/notifiers/posts/global_mock_storage_provider.dart';
import 'package:blogify_flutter_main/presentation/notifiers/user/user_data_notifier.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/home_page.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/home_article_card_item.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/home_bottom_bar.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/home_search_bar.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/user_welcome_row.dart';
import 'package:blogify_flutter_main/presentation/widgets/empty_list_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../notifiers/posts/global_mock_storage_provider_test.dart';
import '../../notifiers/user/user_data_notifier_test.dart';

void main() {
  final MockGetAllPostsUseCase getAllPostsUseCase = MockGetAllPostsUseCase();
  final MockGetPostsByCategoryUseCase getPostsByCategoryUseCase = MockGetPostsByCategoryUseCase();
  final MockLikePostByIdUseCase likePostByIdUseCase = MockLikePostByIdUseCase();
  final MockGetPostByIdUseCase getPostByIdUseCase = MockGetPostByIdUseCase();

  final MockGetUserByIdUseCase getUserByIdUseCase = MockGetUserByIdUseCase();
  final MockDatabaseManager databaseManager = MockDatabaseManager();

  setUpAll(() {
    when(() => databaseManager.getUser()).thenAnswer((_) async => UserEntity.empty());
    when(() => getUserByIdUseCase.call(1)).thenReturn(UserEntity.empty());

    when(() => getPostsByCategoryUseCase.call(PostCategory.trending)).thenReturn([]);
  });

  Future<Widget> buildTestable({required Widget child}) async {
    final userDataNotifier = UserDataNotifier(getUserByIdUseCase, databaseManager);
    await userDataNotifier.init();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryIndexNotifier()),
        ChangeNotifierProvider(create: (_) => userDataNotifier),
        ChangeNotifierProvider(
          create: (_) => GlobalMockStorageProvider(
            getAllPostsUseCase,
            getPostsByCategoryUseCase,
            likePostByIdUseCase,
            getPostByIdUseCase,
          )..initStorage(),
        ),
        ChangeNotifierProvider(create: (_) => SearchBarNotifier()),
      ],
      child: MaterialApp(
        home: child,
        // Provide a dummy router for navigation test
        builder: (context, widget) => widget!,
      ),
    );
  }

  testWidgets('renders UserWelcomeRow, HomeSearchBar, HomeBottomBar', (tester) async {
    await tester.pumpWidget(await buildTestable(child: const HomePage()));

    expect(find.byType(UserWelcomeRow), findsOneWidget);
    expect(find.byType(HomeSearchBar), findsOneWidget);
    expect(find.byType(HomeBottomBar), findsOneWidget);
  });

  testWidgets('shows EmptyListPlaceholder when no posts', (tester) async {
    await tester.pumpWidget(await buildTestable(child: const HomePage()));

    expect(find.byType(EmptyListPlaceholder), findsOneWidget);
    expect(find.byType(CardSwiper), findsNothing);
  });

  testWidgets('shows CardSwiper and HomeArticleCardItem when posts exist', (tester) async {
    final mockPost = PostEntity.empty(); // Adjust to your post model
    when(() => getPostsByCategoryUseCase.call(PostCategory.trending)).thenReturn([mockPost]);

    await tester.pumpWidget(await buildTestable(child: const HomePage()));

    expect(find.byType(CardSwiper), findsOneWidget);
    expect(find.byType(HomeArticleCardItem), findsOneWidget);
    expect(find.byType(EmptyListPlaceholder), findsNothing);
  });

  //todo: mock router has not been set up;
  // testWidgets('openArticlePage triggers navigation', (tester) async {
  //   final mockPost = PostEntity.empty();
  //   when(() => getPostsByCategoryUseCase.call(PostCategory.trending)).thenReturn([mockPost]);
  //
  //   // Use a mock router if you want to verify navigation
  //   await tester.pumpWidget(await buildTestable(child: const HomePage()));
  //
  //   // Tap the card (simulate onTap)
  //   final card = find.byType(HomeArticleCardItem);
  //   expect(card, findsOneWidget);
  //
  //   // You may need to wrap HomeArticleCardItem with a GestureDetector in your widget for this to work
  //   await tester.tap(card);
  //   await tester.pumpAndSettle();
  //
  //   // You can verify navigation by checking the navigation stack or using a mock router
  //   // For simplicity, just ensure the tap doesn't throw
  // });
}

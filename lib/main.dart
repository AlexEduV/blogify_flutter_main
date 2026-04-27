import 'package:blogify_flutter_main/common/app_colors.dart';
import 'package:blogify_flutter_main/data/data_sources/mock_comments_data_source_impl.dart';
import 'package:blogify_flutter_main/data/data_sources/mock_posts_data_source_impl.dart';
import 'package:blogify_flutter_main/l10n/l10n.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/notifiers/category_index_notifier.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/notifiers/search_column_notifier.dart';
import 'package:blogify_flutter_main/router/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/providers/global_mock_comment_provider.dart';
import 'data/providers/global_mock_storage_provider.dart';
import 'data/providers/global_mock_user_provider.dart';

void main() {
  final mockPostsDataSource = MockPostsDataSourceImpl()..init();
  final mockCommentsDataSource = MockCommentsDataSourceImpl()..init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => GlobalMockStorageProvider(mockPostsDataSource)..initStorage()),
      ChangeNotifierProvider(create: (_) => GlobalMockUserProvider()),
      ChangeNotifierProvider(create: (_) => GlobalMockCommentProvider(mockCommentsDataSource)),
      ChangeNotifierProvider(create: (_) => CategoryIndexNotifier()),
      ChangeNotifierProvider(create: (_) => SearchColumnNotifier()),
    ],
    child: const MyApp(),
  ));
}

final appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      title: L10n.appName,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
          fontFamily: 'SFPro'),
      debugShowCheckedModeBanner: false,
    );
  }
}

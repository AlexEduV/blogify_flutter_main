import 'package:blogify_flutter_main/data/mock_storage/global_mock_comment_provider.dart';
import 'package:blogify_flutter_main/data/mock_storage/global_mock_storage_provider.dart';
import 'package:blogify_flutter_main/data/mock_storage/global_mock_user_provider.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/notifiers/category_index_notifier.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/notifiers/search_column_notifier.dart';
import 'package:blogify_flutter_main/presentation/theme/app_colors.dart';
import 'package:blogify_flutter_main/router/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GlobalMockStorageProvider()),
        ChangeNotifierProvider(create: (_) => GlobalMockUserProvider()),
        ChangeNotifierProvider(create: (_) => GlobalMockCommentProvider()),
        ChangeNotifierProvider(create: (_) => CategoryIndexNotifier()),
        ChangeNotifierProvider(create: (_) => SearchColumnNotifier()),
      ],
      child: const MyApp(),
    )
  );
}

final appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      routerConfig: appRouter.config(),
      title: 'Blogify',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
        fontFamily: 'SFPro'
      ),
      debugShowCheckedModeBanner: false,
    );

  }
}


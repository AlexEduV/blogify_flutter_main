import 'package:blogify_flutter_main/common/app_colors.dart';
import 'package:blogify_flutter_main/core/di/injection_container.dart';
import 'package:blogify_flutter_main/l10n/l10n.dart';
import 'package:blogify_flutter_main/presentation/notifiers/home_page/category_index_notifier.dart';
import 'package:blogify_flutter_main/presentation/notifiers/home_page/search_filter_type_notifier.dart';
import 'package:blogify_flutter_main/presentation/notifiers/settings_page/settings_page_notifier.dart';
import 'package:blogify_flutter_main/presentation/notifiers/user/user_data_notifier.dart';
import 'package:blogify_flutter_main/router/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/providers/global_mock_comment_provider.dart';
import 'data/providers/global_mock_storage_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependenciesContainer();

  final userDataNotifier = UserDataNotifier(serviceLocator(), serviceLocator());
  await userDataNotifier.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => GlobalMockStorageProvider(serviceLocator())..initStorage()),
      ChangeNotifierProvider(create: (_) => GlobalMockCommentProvider(serviceLocator())),
      ChangeNotifierProvider(create: (_) => CategoryIndexNotifier()),
      ChangeNotifierProvider(create: (_) => SearchFilterTypeNotifier()),
      ChangeNotifierProvider(create: (_) => userDataNotifier),
      ChangeNotifierProvider(create: (_) => SettingsPageNotifier(serviceLocator())),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final RouterConfig<Object>? routerConfig;

  @override
  void initState() {
    routerConfig = AppRouter().config();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routerConfig,
      title: L10n.appName,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
        fontFamily: 'SFPro',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:blogify_flutter_main/common/app_routes.dart';
import 'package:blogify_flutter_main/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      path: AppRoutes.homeRoute,
      children: [
        AutoRoute(
          page: ArticleRoute.page,
          path: '${AppRoutes.articleRoute}:id',
          children: [AutoRoute(page: CommentsRoute.page, path: '${AppRoutes.commentRoute}:id')],
        ),

        AutoRoute(page: PlaceholderRoute.page, path: AppRoutes.addArticleRoute),

        AutoRoute(page: AccountRoute.page, path: AppRoutes.userRoute),
      ],
    ),
  ];
}

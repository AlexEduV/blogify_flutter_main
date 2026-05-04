import 'package:auto_route/auto_route.dart';
import 'package:blogify_flutter_main/common/app_routes.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, path: AppRoutes.homeRoute),

    AutoRoute(page: ArticleRoute.page, path: '${AppRoutes.homeRoute}${AppRoutes.articleRoute}:id'),

    AutoRoute(
      page: CommentsRoute.page,
      path: '${AppRoutes.homeRoute}${AppRoutes.articleRoute}${AppRoutes.commentRoute}:id',
    ),

    AutoRoute(
      page: PlaceholderRoute.page,
      path: '${AppRoutes.homeRoute}${AppRoutes.addArticleRoute}',
    ),

    AutoRoute(page: AccountRoute.page, path: '${AppRoutes.homeRoute}${AppRoutes.userRoute}'),

    AutoRoute(
      page: PublishedArticlesRoute.page,
      path: '${AppRoutes.homeRoute}${AppRoutes.userRoute}${AppRoutes.publishedArticles}',
    ),

    AutoRoute(
      page: LikedArticlesRoute.page,
      path: '${AppRoutes.homeRoute}${AppRoutes.userRoute}${AppRoutes.likedArticles}',
    ),
  ];
}

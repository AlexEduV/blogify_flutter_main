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
        ),
        AutoRoute(
          page: ArticleRoute.page,
          path: '${AppRoutes.homeRoute}${AppRoutes.articleRoute}:id',
        ),
        AutoRoute(
          page: CommentsRoute.page,
          path: '${AppRoutes.homeRoute}${AppRoutes.articleRoute}${AppRoutes.commentRoute}:id',
        ),
        AutoRoute(
          page: UserSettingsRoute.page,
          path: '${AppRoutes.homeRoute}${AppRoutes.userRoute}',
          fullscreenDialog: true,
        ),
      ];
}

import 'package:auto_route/auto_route.dart';
import 'package:blogify_flutter_main/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, path: '/'),
    AutoRoute(page: ArticleRoute.page, path: '/article/:id'),
    AutoRoute(page: CommentsRoute.page, path: '/article/comments/:id')
  ];
}

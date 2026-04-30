import 'package:blogify_flutter_main/common/app_routes.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppRoutes', () {
    test('should have correct route values', () {
      expect(AppRoutes.homeRoute, '/');
      expect(AppRoutes.articleRoute, 'article/');
      expect(AppRoutes.commentRoute, 'comments/');
      expect(AppRoutes.userRoute, 'user/');
      expect(AppRoutes.addArticleRoute, 'addArticle/');
    });
  });
}

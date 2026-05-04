// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:blogify_flutter_main/presentation/pages/account_page/account_page.dart'
    as _i1;
import 'package:blogify_flutter_main/presentation/pages/account_page/sub_pages/liked_articles_page/liked_articles_page.dart'
    as _i5;
import 'package:blogify_flutter_main/presentation/pages/account_page/sub_pages/published_articles_page/published_articles_page.dart'
    as _i7;
import 'package:blogify_flutter_main/presentation/pages/article_page/article_page.dart'
    as _i2;
import 'package:blogify_flutter_main/presentation/pages/comments_page/comments_page.dart'
    as _i3;
import 'package:blogify_flutter_main/presentation/pages/home_page/home_page.dart'
    as _i4;
import 'package:blogify_flutter_main/presentation/widgets/placeholder_page.dart'
    as _i6;
import 'package:flutter/material.dart' as _i9;

/// generated route for
/// [_i1.AccountPage]
class AccountRoute extends _i8.PageRouteInfo<void> {
  const AccountRoute({List<_i8.PageRouteInfo>? children})
    : super(AccountRoute.name, initialChildren: children);

  static const String name = 'AccountRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.AccountPage();
    },
  );
}

/// generated route for
/// [_i2.ArticlePage]
class ArticleRoute extends _i8.PageRouteInfo<ArticleRouteArgs> {
  ArticleRoute({
    required int articleId,
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         ArticleRoute.name,
         args: ArticleRouteArgs(articleId: articleId, key: key),
         initialChildren: children,
       );

  static const String name = 'ArticleRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ArticleRouteArgs>();
      return _i2.ArticlePage(articleId: args.articleId, key: args.key);
    },
  );
}

class ArticleRouteArgs {
  const ArticleRouteArgs({required this.articleId, this.key});

  final int articleId;

  final _i9.Key? key;

  @override
  String toString() {
    return 'ArticleRouteArgs{articleId: $articleId, key: $key}';
  }
}

/// generated route for
/// [_i3.CommentsPage]
class CommentsRoute extends _i8.PageRouteInfo<CommentsRouteArgs> {
  CommentsRoute({
    required int id,
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         CommentsRoute.name,
         args: CommentsRouteArgs(id: id, key: key),
         initialChildren: children,
       );

  static const String name = 'CommentsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CommentsRouteArgs>();
      return _i3.CommentsPage(id: args.id, key: args.key);
    },
  );
}

class CommentsRouteArgs {
  const CommentsRouteArgs({required this.id, this.key});

  final int id;

  final _i9.Key? key;

  @override
  String toString() {
    return 'CommentsRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomePage();
    },
  );
}

/// generated route for
/// [_i5.LikedArticlesPage]
class LikedArticlesRoute extends _i8.PageRouteInfo<void> {
  const LikedArticlesRoute({List<_i8.PageRouteInfo>? children})
    : super(LikedArticlesRoute.name, initialChildren: children);

  static const String name = 'LikedArticlesRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.LikedArticlesPage();
    },
  );
}

/// generated route for
/// [_i6.PlaceholderPage]
class PlaceholderRoute extends _i8.PageRouteInfo<void> {
  const PlaceholderRoute({List<_i8.PageRouteInfo>? children})
    : super(PlaceholderRoute.name, initialChildren: children);

  static const String name = 'PlaceholderRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.PlaceholderPage();
    },
  );
}

/// generated route for
/// [_i7.PublishedArticlesPage]
class PublishedArticlesRoute extends _i8.PageRouteInfo<void> {
  const PublishedArticlesRoute({List<_i8.PageRouteInfo>? children})
    : super(PublishedArticlesRoute.name, initialChildren: children);

  static const String name = 'PublishedArticlesRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.PublishedArticlesPage();
    },
  );
}

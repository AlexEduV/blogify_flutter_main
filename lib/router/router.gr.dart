// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:blogify_flutter_main/presentation/pages/account_page/account_page.dart'
    as _i5;
import 'package:blogify_flutter_main/presentation/pages/article_page/article_page.dart'
    as _i1;
import 'package:blogify_flutter_main/presentation/pages/comments_page/comments_page.dart'
    as _i2;
import 'package:blogify_flutter_main/presentation/pages/home_page/home_page.dart'
    as _i3;
import 'package:blogify_flutter_main/presentation/widgets/placeholder_page.dart'
    as _i4;
import 'package:flutter/material.dart' as _i7;

/// generated route for
/// [_i1.ArticlePage]
class ArticleRoute extends _i6.PageRouteInfo<ArticleRouteArgs> {
  ArticleRoute({
    required int articleId,
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         ArticleRoute.name,
         args: ArticleRouteArgs(articleId: articleId, key: key),
         initialChildren: children,
       );

  static const String name = 'ArticleRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ArticleRouteArgs>();
      return _i1.ArticlePage(articleId: args.articleId, key: args.key);
    },
  );
}

class ArticleRouteArgs {
  const ArticleRouteArgs({required this.articleId, this.key});

  final int articleId;

  final _i7.Key? key;

  @override
  String toString() {
    return 'ArticleRouteArgs{articleId: $articleId, key: $key}';
  }
}

/// generated route for
/// [_i2.CommentsPage]
class CommentsRoute extends _i6.PageRouteInfo<CommentsRouteArgs> {
  CommentsRoute({
    required int id,
    _i7.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         CommentsRoute.name,
         args: CommentsRouteArgs(id: id, key: key),
         initialChildren: children,
       );

  static const String name = 'CommentsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CommentsRouteArgs>();
      return _i2.CommentsPage(id: args.id, key: args.key);
    },
  );
}

class CommentsRouteArgs {
  const CommentsRouteArgs({required this.id, this.key});

  final int id;

  final _i7.Key? key;

  @override
  String toString() {
    return 'CommentsRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}

/// generated route for
/// [_i4.PlaceholderPage]
class PlaceholderRoute extends _i6.PageRouteInfo<void> {
  const PlaceholderRoute({List<_i6.PageRouteInfo>? children})
    : super(PlaceholderRoute.name, initialChildren: children);

  static const String name = 'PlaceholderRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.PlaceholderPage();
    },
  );
}

/// generated route for
/// [_i5.UserSettingsPage]
class UserSettingsRoute extends _i6.PageRouteInfo<void> {
  const UserSettingsRoute({List<_i6.PageRouteInfo>? children})
    : super(UserSettingsRoute.name, initialChildren: children);

  static const String name = 'UserSettingsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.UserSettingsPage();
    },
  );
}

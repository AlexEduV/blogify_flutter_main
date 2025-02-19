// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:blogify_flutter_main/presentation/pages/article_page/article_page.dart'
    as _i1;
import 'package:blogify_flutter_main/presentation/pages/comments_page/comments_page.dart'
    as _i2;
import 'package:blogify_flutter_main/presentation/pages/home_page/home_page.dart'
    as _i3;
import 'package:flutter/material.dart' as _i5;

/// generated route for
/// [_i1.ArticlePage]
class ArticleRoute extends _i4.PageRouteInfo<ArticleRouteArgs> {
  ArticleRoute({
    required int id,
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
         ArticleRoute.name,
         args: ArticleRouteArgs(id: id, key: key),
         initialChildren: children,
       );

  static const String name = 'ArticleRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ArticleRouteArgs>();
      return _i1.ArticlePage(id: args.id, key: args.key);
    },
  );
}

class ArticleRouteArgs {
  const ArticleRouteArgs({required this.id, this.key});

  final int id;

  final _i5.Key? key;

  @override
  String toString() {
    return 'ArticleRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [_i2.CommentsPage]
class CommentsRoute extends _i4.PageRouteInfo<CommentsRouteArgs> {
  CommentsRoute({
    required int id,
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
         CommentsRoute.name,
         args: CommentsRouteArgs(id: id, key: key),
         initialChildren: children,
       );

  static const String name = 'CommentsRoute';

  static _i4.PageInfo page = _i4.PageInfo(
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

  final _i5.Key? key;

  @override
  String toString() {
    return 'CommentsRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}

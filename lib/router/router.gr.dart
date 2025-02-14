// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:blogify_flutter_main/presentation/pages/article_page/article_page.dart'
    as _i1;
import 'package:blogify_flutter_main/presentation/pages/home_page/home_page.dart'
    as _i2;
import 'package:flutter/material.dart' as _i4;

/// generated route for
/// [_i1.ArticlePage]
class ArticleRoute extends _i3.PageRouteInfo<ArticleRouteArgs> {
  ArticleRoute({
    required int index,
    _i4.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
         ArticleRoute.name,
         args: ArticleRouteArgs(index: index, key: key),
         initialChildren: children,
       );

  static const String name = 'ArticleRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ArticleRouteArgs>();
      return _i1.ArticlePage(index: args.index, key: args.key);
    },
  );
}

class ArticleRouteArgs {
  const ArticleRouteArgs({required this.index, this.key});

  final int index;

  final _i4.Key? key;

  @override
  String toString() {
    return 'ArticleRouteArgs{index: $index, key: $key}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ArticlePage extends StatefulWidget {

  final int index;

  const ArticlePage({
    required this.index,
    super.key,
  });

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

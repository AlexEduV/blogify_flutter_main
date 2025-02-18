import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CommentsPage extends StatefulWidget {

  final int id;

  const CommentsPage({
    required this.id,
    super.key,
  });

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [

          //comment field

          //comments or a placeholder

        ],
      ),

    );
  }
}


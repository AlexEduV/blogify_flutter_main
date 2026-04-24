import 'package:flutter/material.dart';

class EmptyPostsPlaceholder extends StatelessWidget {
  const EmptyPostsPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'No posts available at the moment.',
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {

  final String title;

  const SectionTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
            fontSize: 13.0,
          ),
        ),
      ],
    );
  }
}

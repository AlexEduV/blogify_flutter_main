import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CircledButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback onTap;

  const CircledButton({
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: FaIcon(
          icon,
          color: Colors.black54,
          size: 20,
        ),
      ),
    );
  }
}

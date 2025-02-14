import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CircledButtonOutlined extends StatelessWidget {

  final IconData icon;
  final VoidCallback onTap;

  const CircledButtonOutlined({
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey[300]!, width: 1),
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

import 'package:flutter/material.dart';

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
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey[200]!, width: 1),
        ),
        child: Icon(
          Icons.person,
          color: Colors.black54,
          size: 24,
        ),
      ),
    );
  }
}

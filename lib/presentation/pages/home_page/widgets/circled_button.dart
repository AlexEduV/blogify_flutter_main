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

    return Material(
      borderRadius: BorderRadius.circular(50.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border(
              bottom: BorderSide(
                color: Colors.grey[300]!,
                width: 0.5,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[200]!,
                offset: const Offset(0, 2),
                blurRadius: 5.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: FaIcon(
            icon,
            color: Colors.black54,
            size: 20,
          ),
        ),
      ),
    );
  }
}

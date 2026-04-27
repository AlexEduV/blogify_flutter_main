import 'package:blogify_flutter_main/common/app_dimensions.dart';
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200]!,
            offset: const Offset(0, 2),
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ],
      ),

      //todo: use circle shape here
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(50.0),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(50.0),
          child: Container(
            padding: const EdgeInsets.all(AppDimensions.normalM),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey[300]!,
                  width: 0.5,
                ),
              ),
            ),
            child: FaIcon(
              icon,
              color: Colors.black54,
              size: AppDimensions.appBarIconSize,
            ),
          ),
        ),
      ),
    );
  }
}

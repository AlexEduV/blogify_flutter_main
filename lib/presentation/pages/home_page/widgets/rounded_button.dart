import 'package:blogify_flutter_main/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  final bool isSelected;
  final IconData? icon;
  final String text;
  final Function()? onTap;

  const RoundedButton({
    required this.text,
    this.icon,
    this.isSelected = false,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          color: isSelected ? AppColors.primaryColor : null,
        ),
        child: Row(
          spacing: 4.0,
          children: [

            Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.black87 : AppColors.accentColor,
                fontWeight: FontWeight.w400,
              ),
            ),

            if (icon != null)
              Icon(
                icon,
                color: Colors.black87,
                size: 24,
              ),

          ],
        ),
      ),
    );
  }
}

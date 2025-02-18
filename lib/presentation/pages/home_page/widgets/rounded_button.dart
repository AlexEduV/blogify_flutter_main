import 'package:blogify_flutter_main/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  final bool isOpaque;
  final IconData? trailingIcon;
  final IconData? leadingIcon;
  final double horizontalPadding;
  final String text;
  final double borderRadius;
  final Function()? onTap;
  final Color backgroundColor;
  final Color tintColor;

  const RoundedButton({
    required this.text,
    this.leadingIcon,
    this.trailingIcon,
    this.isOpaque = false,
    this.horizontalPadding = 16.0,
    this.borderRadius = 24.0,
    this.backgroundColor = AppColors.primaryColor,
    this.tintColor = Colors.black,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Material(
      color: isOpaque ? backgroundColor : Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: horizontalPadding),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 8.0,
            children: [

              if (leadingIcon != null)
                Icon(
                  leadingIcon,
                  color: tintColor,
                  size: 20,
                ),

              Text(
                text,
                style: TextStyle(
                  color: isOpaque ? tintColor : AppColors.accentColor,
                  fontWeight: FontWeight.w500,
                ),
              ),

              if (trailingIcon != null)
                Icon(
                  trailingIcon,
                  color: tintColor,
                  size: 20,
                ),

            ],
          ),
        ),
      ),
    );
  }
}

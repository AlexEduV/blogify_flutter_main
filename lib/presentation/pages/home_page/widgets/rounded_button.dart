import 'package:blogify_flutter_main/common/app_colors.dart';
import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/common/app_text_styles.dart';
import 'package:blogify_flutter_main/common/extensions/num_extension.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final bool selected;
  final IconData? trailingIcon;
  final IconData? leadingIcon;
  final double horizontalPadding;
  final String text;
  final double borderRadius;
  final Function()? onTap;
  final Color selectedColor;
  final Color unselectedColor;
  final Color tintColor;
  final bool? expanded;

  const RoundedButton({
    required this.text,
    this.leadingIcon,
    this.trailingIcon,
    this.selected = false,
    this.horizontalPadding = AppDimensions.normalM,
    this.borderRadius = AppDimensions.majorS,
    this.selectedColor = AppColors.primaryColor,
    this.unselectedColor = Colors.transparent,
    this.tintColor = Colors.black,
    this.onTap,
    this.expanded = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? selectedColor : unselectedColor,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppDimensions.minorL,
            horizontal: horizontalPadding,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: AppDimensions.minorL,
            children: [
              if (leadingIcon != null) ...[
                Icon(leadingIcon, color: tintColor, size: AppDimensions.appBarIconSize),
              ],
              Text(
                text,
                style: AppTextStyles.sfPro14.copyWith(
                  color: selected ? tintColor : AppColors.accentColor,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
              if (trailingIcon != null) ...[
                AnimatedRotation(
                  duration: const Duration(milliseconds: 250),
                  turns: (expanded ?? false) ? -360.toTurns : -180.toTurns,
                  child: Icon(trailingIcon, color: tintColor, size: AppDimensions.appBarIconSize),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

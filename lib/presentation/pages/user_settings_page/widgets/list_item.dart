import 'package:blogify_flutter_main/common/app_colors.dart';
import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/presentation/pages/user_settings_page/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function()? onTap;
  final double borderRadius;

  const ListItem({
    required this.title,
    required this.icon,
    this.onTap,
    this.borderRadius = AppDimensions.minorL,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.settingsItemColor,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.normalS, horizontal: AppDimensions.normalM),
          child: Row(
            spacing: AppDimensions.minorL,
            children: [
              FaIcon(
                icon,
                size: AppDimensions.appBarIconSize,
                color: Colors.black87,
              ),
              SectionTitle(title: title),
            ],
          ),
        ),
      ),
    );
  }
}

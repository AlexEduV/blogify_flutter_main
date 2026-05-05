import 'package:blogify_flutter_main/common/app_colors.dart';
import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/common/semantics_labels.dart';
import 'package:blogify_flutter_main/domain/models/account_section_item_model.dart';
import 'package:blogify_flutter_main/presentation/pages/account_page/widgets/section_title.dart';
import 'package:blogify_flutter_main/presentation/widgets/app_semantics.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountListItem extends StatelessWidget {
  final AccountSectionItemModel model;
  final double borderRadius;

  const AccountListItem({required this.model, this.borderRadius = AppDimensions.minorL, super.key});

  @override
  Widget build(BuildContext context) {
    return AppSemantics(
      button: true,
      label: SemanticsLabels.accountPageItem,
      child: Material(
        color: AppColors.settingsItemColor,
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: model.onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimensions.normalS,
              horizontal: AppDimensions.normalM,
            ),
            child: Row(
              spacing: AppDimensions.minorL,
              children: [
                FaIcon(model.icon, size: AppDimensions.appBarIconSize, color: Colors.black87),
                SectionTitle(title: model.title),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:blogify_flutter_main/domain/models/account_section_item_model.dart';
import 'package:blogify_flutter_main/presentation/pages/account_page/widgets/section_title.dart';
import 'package:flutter/material.dart';

import '../../../../common/app_dimensions.dart';
import 'account_list_item.dart';

class AccountSection extends StatelessWidget {
  final String title;
  final List<AccountSectionItemModel> items;

  const AccountSection({required this.title, required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: AppDimensions.majorL),

        SectionTitle(title: title),

        const SizedBox(height: AppDimensions.normalM),

        Column(
          spacing: AppDimensions.normalM,
          children: items.map((item) {
            return AccountListItem(model: item);
          }).toList(),
        ),
      ],
    );
  }
}

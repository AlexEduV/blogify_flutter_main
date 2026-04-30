import 'package:blogify_flutter_main/presentation/pages/account_page/widgets/section_title.dart';
import 'package:flutter/material.dart';

import '../../../../common/app_dimensions.dart';
import 'account_list_item.dart';

class AccountSection extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> items;

  const AccountSection({required this.title, required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: AppDimensions.majorL),

        SectionTitle(title: title),

        const SizedBox(height: AppDimensions.normalM),

        //todo: can be refactored to 'spacing: '
        ...items.map((item) {
          return Column(
            children: [
              AccountListItem(
                //todo: onTap has to lead somewhere
                onTap: () {},
                icon: item['icon'],
                title: item['title'],
              ),
              const SizedBox(height: AppDimensions.normalM),
            ],
          );
        }),
      ],
    );
  }
}

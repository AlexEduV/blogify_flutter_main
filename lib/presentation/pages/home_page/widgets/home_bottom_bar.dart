import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../data/mock_storage/global_mock_storage_provider.dart';
import '../../../../domain/helpers/category_helper.dart';
import '../notifiers/category_index_notifier.dart';
import 'category_selector.dart';
import 'circled_button.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryIndexNotifier>(builder: (context, notifier, child) {
      return Row(
        spacing: AppDimensions.normalS,
        children: [
          Expanded(
            child: CategorySelector(
              selectedIndex: notifier.categoryIndex,
              items: const [
                //todo: can be moved to an enum
                L10n.postsCategoryTrending,
                L10n.postsCategoryDesign,
                L10n.postsCategoryTech,
              ],
              onItemTapped: (index) => onCategoryItemTapped(context, index),
            ),
          ),
          CircledButton(
            icon: FontAwesomeIcons.penToSquare,
            onTap: () {
              //todo: new publication screen
              //todo: create a dummy feature screen
            },
          ),
        ],
      );
    });
  }

  void onCategoryItemTapped(BuildContext context, int index) {
    //update index
    context.read<CategoryIndexNotifier>().update(index);

    //filter storage
    final category = CategoryHelper.getCategoryByIndex(index);

    final storageNotifier = context.read<GlobalMockStorageProvider>();
    storageNotifier.loadAllInCategory(category);
  }
}

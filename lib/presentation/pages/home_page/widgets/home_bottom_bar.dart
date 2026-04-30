import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/segmented_switch.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../common/enums/post_category.dart';
import '../../../notifiers/home_page/category_index_notifier.dart';
import '../../../notifiers/posts/global_mock_storage_provider.dart';
import 'circled_button.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryIndexNotifier>(
      builder: (context, notifier, child) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: AppDimensions.normalS,
          children: [
            Expanded(
              child: SegmentedSwitch(
                previousIndex: notifier.previousIndex,
                selectedIndex: notifier.categoryIndex,
                options: [
                  PostCategory.trending.label,
                  PostCategory.design.label,
                  PostCategory.tech.label,
                ],
                onChanged: (index) => onCategoryItemTapped(context, index),
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
      },
    );
  }

  void onCategoryItemTapped(BuildContext context, int index) {
    //update index
    context.read<CategoryIndexNotifier>().update(index);

    //filter storage
    final category = PostCategory.values.where((element) => element.tabIndex == index).first;

    final storageNotifier = context.read<GlobalMockStorageProvider>();
    storageNotifier.loadAllInCategory(category);
  }
}

import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/common/app_text_styles.dart';
import 'package:blogify_flutter_main/common/enums/post_filter.dart';
import 'package:blogify_flutter_main/l10n/l10n.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../common/app_colors.dart';
import '../../../notifiers/home_page/search_filter_type_notifier.dart';
import '../../../notifiers/posts/global_mock_storage_provider.dart';
import 'menu_item.dart';

class HomeSearchBar extends StatelessWidget {
  final FocusNode focusNode;
  final GlobalKey searchMenuKey;

  const HomeSearchBar({required this.searchMenuKey, required this.focusNode, super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      focusNode: focusNode,
      padding: const WidgetStatePropertyAll(
        EdgeInsets.only(left: AppDimensions.normalM, right: AppDimensions.minorL),
      ),
      leading: const FaIcon(
        FontAwesomeIcons.magnifyingGlass,
        color: AppColors.accentColor,
        size: AppDimensions.appBarIconSize,
      ),
      trailing: [
        Consumer<SearchFilterTypeNotifier>(
          builder: (context, notifier, child) {
            return RoundedButton(
              key: searchMenuKey,
              text: notifier.value.label,
              expanded: notifier.isSelectionOpen,
              trailingIcon: Icons.keyboard_arrow_up_outlined,
              selected: true,
              onTap: () => showSearchFilterTypeSelector(context),
            );
          },
        ),
      ],
      hintText: L10n.searchBarHint,
      hintStyle: WidgetStatePropertyAll(AppTextStyles.sfPro16Accent),
      elevation: const WidgetStatePropertyAll(0.0),
      backgroundColor: const WidgetStatePropertyAll(Colors.white),
      shape: WidgetStateProperty.resolveWith<RoundedRectangleBorder>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused)) {
          return RoundedRectangleBorder(
            side: const BorderSide(color: AppColors.emeraldGreen, width: AppDimensions.minorXS),
            // Highlighted border
            borderRadius: BorderRadius.circular(AppDimensions.majorL),
          );
        }

        //default value
        return RoundedRectangleBorder(
          side: BorderSide(color: AppColors.offGrey),
          borderRadius: BorderRadius.circular(AppDimensions.majorL),
        );
      }),
      onChanged: (String filter) {
        final storageNotifier = context.read<GlobalMockStorageProvider>();
        final searchColumnNotifier = context.read<SearchFilterTypeNotifier>();
        storageNotifier.filter(filter, searchColumnNotifier.value);
      },
    );
  }

  Future<void> showSearchFilterTypeSelector(BuildContext context) async {
    //todo: add an outward border radius, but first look at interaction design you might really like;

    final menuNotifier = context.read<SearchFilterTypeNotifier>();
    final List<PostFilter> items = PostFilter.values;

    menuNotifier.setIsMenuExpanded(true);

    await showMenu<String>(
      context: context,
      initialValue: menuNotifier.value.label,
      position: getMenuPosition(),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimensions.minorL)),
      elevation: 25.0,
      shadowColor: Colors.grey,
      menuPadding: EdgeInsets.zero,
      items: List.generate(items.length, (index) {
        final item = items[index];

        return PopupMenuItem<String>(
          padding: EdgeInsets.zero,
          value: item.label,
          child: MenuItem(text: item.label),
          onTap: () => menuNotifier.updateFilterType(item),
        );
      }),
    );

    menuNotifier.setIsMenuExpanded(false);
  }

  RelativeRect? getMenuPosition() {
    final context = searchMenuKey.currentContext;
    if (context == null) {
      return null;
    }

    final renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero); // Button's global position
    final size = renderBox.size;

    return RelativeRect.fromLTRB(
      offset.dx - 5, // X Position (left and some space)
      offset.dy + size.height + 10, // Y Position (below the button)
      offset.dx + size.width, // Right boundary
      offset.dy + size.height + 200, // Bottom boundary (just enough space)
    );
  }
}

import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/common/app_text_styles.dart';
import 'package:blogify_flutter_main/common/enums/post_filter.dart';
import 'package:blogify_flutter_main/l10n/l10n.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../common/app_colors.dart';
import '../../../../data/providers/global_mock_storage_provider.dart';
import '../notifiers/search_column_notifier.dart';
import 'menu_item.dart';

class HomeSearchBar extends StatelessWidget {
  final FocusNode focusNode;
  final GlobalKey selectorKey;

  const HomeSearchBar({required this.selectorKey, required this.focusNode, super.key});

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
        Consumer<SearchColumnNotifier>(builder: (context, notifier, child) {
          return RoundedButton(
            key: selectorKey,
            text: notifier.value.label,
            expanded: notifier.isSelectionOpen,
            trailingIcon: Icons.keyboard_arrow_up_outlined,
            filled: true,
            onTap: () => showSearchColumnSelector(context),
          );
        }),
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
        final searchColumnNotifier = context.read<SearchColumnNotifier>();
        storageNotifier.filter(filter, searchColumnNotifier.value);
      },
    );
  }

  Future<void> showSearchColumnSelector(BuildContext context) async {
    final RenderBox renderBox = selectorKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero); // Button's global position
    final Size size = renderBox.size; // Button's size

    final selectorNotifier = context.read<SearchColumnNotifier>();
    selectorNotifier.updateSelectionOpenedState(true);

    final List<PostFilter> items = PostFilter.values;

    await showMenu(
      context: context,
      initialValue: selectorNotifier.value,
      position: RelativeRect.fromLTRB(
        offset.dx - 10, // X Position (left and some space)
        offset.dy + size.height + 10, // Y Position (below the button)
        offset.dx + size.width, // Right boundary
        offset.dy + size.height + 200, // Bottom boundary (just enough space)
      ),
      color: Colors.white,
      elevation: 50.0,
      shadowColor: Colors.grey,
      menuPadding: EdgeInsets.zero,
      items: [
        PopupMenuItem<String>(
          padding: EdgeInsets.zero,
          value: items[0].label,
          child: MenuItem(text: items[0].label),
          onTap: () => selectorNotifier.updateFilterType(items[0]),
        ),
        PopupMenuItem<String>(
          padding: EdgeInsets.zero,
          value: items[1].label,
          child: MenuItem(text: items[1].label),
          onTap: () => selectorNotifier.updateFilterType(items[1]),
        ),
      ],
    );

    selectorNotifier.updateSelectionOpenedState(false);
  }
}

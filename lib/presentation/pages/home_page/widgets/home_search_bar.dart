import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/l10n/l10n.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../common/app_colors.dart';
import '../../../../data/mock_storage/global_mock_storage_provider.dart';
import '../notifiers/search_column_notifier.dart';
import 'menu_item.dart';

class HomeSearchBar extends StatelessWidget {
  final GlobalKey selectorKey;

  const HomeSearchBar({required this.selectorKey, super.key});

  @override
  Widget build(BuildContext context) {
    //search bar
    //todo: if I search for something, and then open another page, the keyboard,
    // which was on, returns, when I come back, but after navigating back and forth
    // it seems not normal

    return SearchBar(
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
          //todo: find a way to animate between two state icons
          return RoundedButton(
            key: selectorKey,
            text: notifier.value,
            trailingIcon: notifier.isSelectionOpen
                ? Icons.keyboard_arrow_up_outlined
                : Icons.keyboard_arrow_down_outlined,
            filled: true,
            onTap: () => showSearchColumnSelector(context),
          );
        }),
      ],
      hintText: L10n.searchBarHint,
      hintStyle: const WidgetStatePropertyAll(
        TextStyle(
          color: AppColors.accentColor,
          fontSize: 16.0,
        ),
      ),
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
          side: BorderSide(color: AppColors.textFieldBorderColor),
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

    //todo: use an enum
    final List<String> items = [L10n.searchFilterAuthor, L10n.searchFilterTitle];

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
          value: items[0],
          child: MenuItem(text: items[0]),
          onTap: () => selectorNotifier.updateColumn(items[0]),
        ),
        PopupMenuItem<String>(
          padding: EdgeInsets.zero,
          value: items[1],
          child: MenuItem(text: items[1]),
          onTap: () => selectorNotifier.updateColumn(items[1]),
        ),
      ],
    );

    selectorNotifier.updateSelectionOpenedState(false);
  }
}

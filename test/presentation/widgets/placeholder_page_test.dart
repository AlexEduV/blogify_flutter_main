import 'package:blogify_flutter_main/common/app_colors.dart';
import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/common/app_text_styles.dart';
import 'package:blogify_flutter_main/l10n/l10n.dart';
import 'package:blogify_flutter_main/presentation/widgets/placeholder_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  group('PlaceholderPage', () {
    testWidgets('renders icon, title, and subtitle', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: PlaceholderPage()));

      // Icon
      final iconFinder = find.byIcon(FontAwesomeIcons.hourglassStart);
      expect(iconFinder, findsOneWidget);

      // Title
      expect(find.text(L10n.placeholderPageTitle), findsOneWidget);

      // Subtitle
      expect(find.text(L10n.placeholderPageSubtitle), findsOneWidget);

      // Scaffold background color
      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
      expect(scaffold.backgroundColor, AppColors.offGrey);

      // Title style
      final titleText = tester.widget<Text>(find.text(L10n.placeholderPageTitle));
      expect(titleText.style, AppTextStyles.sfPro24);

      // Subtitle style and alignment
      final subtitleText = tester.widget<Text>(find.text(L10n.placeholderPageSubtitle));
      expect(subtitleText.style?.fontSize, AppTextStyles.sfPro16.fontSize);
      expect(subtitleText.textAlign, TextAlign.center);
    });

    testWidgets('has correct layout and spacing', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: PlaceholderPage()));

      // Check for SizedBox widgets with correct heights
      final sizedBoxes = find.byType(SizedBox);
      expect(sizedBoxes, findsNWidgets(3));

      final sizedBoxHeights = sizedBoxes
          .evaluate()
          .map((e) => (e.widget as SizedBox).height)
          .toList();
      expect(sizedBoxHeights, containsAll([AppDimensions.normalM, AppDimensions.minorL]));
    });
  });
}

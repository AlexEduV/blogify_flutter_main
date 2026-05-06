import 'package:blogify_flutter_main/common/app_colors.dart';
import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/circled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  testWidgets('CircledButton displays icon and triggers onTap', (WidgetTester tester) async {
    bool tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CircledButton(icon: FontAwesomeIcons.plus, onTap: () => tapped = true),
        ),
      ),
    );

    // Icon is present
    final iconFinder = find.byType(FaIcon);
    expect(iconFinder, findsOneWidget);

    final faIcon = tester.widget<FaIcon>(iconFinder);
    expect(faIcon.icon, FontAwesomeIcons.plus);
    expect(faIcon.color, Colors.black54);
    expect(faIcon.size, AppDimensions.appBarIconSize);

    // Tap triggers callback
    await tester.tap(find.byType(InkWell));
    expect(tapped, isTrue);
  });

  testWidgets('CircledButton has correct shape, border, and boxShadow', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CircledButton(icon: FontAwesomeIcons.plus, onTap: () {}),
        ),
      ),
    );

    // Find the Ink widget
    final inkFinder = find.byType(Ink);
    expect(inkFinder, findsOneWidget);

    final inkWidget = tester.widget<Ink>(inkFinder);
    final decoration = inkWidget.decoration as BoxDecoration;

    // Shape
    expect(decoration.shape, BoxShape.circle);

    // Border
    expect(decoration.border, isNotNull);
    final border = decoration.border as Border;
    expect(border.bottom.color, AppColors.lightGrey);
    expect(border.bottom.width, 0.5);

    // BoxShadow
    expect(decoration.boxShadow, isNotNull);
    expect(decoration.boxShadow!.any((shadow) => shadow.color == AppColors.offGrey), isTrue);
  });

  testWidgets('CircledButton has correct padding', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CircledButton(icon: FontAwesomeIcons.plus, onTap: () {}),
        ),
      ),
    );

    // Outer padding
    final paddingFinder = find.byType(Padding).first;
    final paddingWidget = tester.widget<Padding>(paddingFinder);
    final padding = paddingWidget.padding as EdgeInsets;
    expect(padding.right, AppDimensions.normalM);

    // Inner padding
    final innerPaddingFinder = find.byType(Padding).last;
    final innerPaddingWidget = tester.widget<Padding>(innerPaddingFinder);
    final innerPadding = innerPaddingWidget.padding as EdgeInsets;
    expect(innerPadding.left, AppDimensions.normalM);
  });
}

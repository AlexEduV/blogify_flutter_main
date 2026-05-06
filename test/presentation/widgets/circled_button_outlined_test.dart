import 'package:blogify_flutter_main/common/app_colors.dart';
import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/presentation/widgets/app_semantics.dart';
import 'package:blogify_flutter_main/presentation/widgets/circled_button_outlined.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  testWidgets('CircledButtonOutlined displays icon and triggers onTap', (
    WidgetTester tester,
  ) async {
    bool tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CircledButtonOutlined(
            icon: FontAwesomeIcons.plus,
            onTap: () => tapped = true,
            semanticsLabel: 'Add',
            isSelected: true,
          ),
        ),
      ),
    );

    // Verify the icon is present
    expect(find.byType(FaIcon), findsOneWidget);

    // Verify the semantics label is set
    final semantics = tester.widget<AppSemantics>(find.byType(AppSemantics));
    expect(semantics.label, 'Add');
    expect(semantics.isSelected, true);

    // Tap the button and verify onTap is called
    await tester.tap(find.byType(InkWell));
    expect(tapped, isTrue);

    // Verify the outlined circle
    final container = tester.widget<Container>(
      find.descendant(of: find.byType(InkWell), matching: find.byType(Container)),
    );
    final decoration = container.decoration as BoxDecoration;
    expect(decoration.shape, BoxShape.circle);
    expect(decoration.border, isNotNull);
    expect((decoration.border as Border).top.color, AppColors.lightGrey);

    // Verify icon size and color
    final faIcon = tester.widget<FaIcon>(find.byType(FaIcon));
    expect(faIcon.icon, FontAwesomeIcons.plus);
    expect(faIcon.color, Colors.black54);
    expect(faIcon.size, AppDimensions.appBarIconSize);
  });

  testWidgets('CircledButtonOutlined uses default semanticsLabel and isSelected', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CircledButtonOutlined(icon: FontAwesomeIcons.minus, onTap: () {}),
        ),
      ),
    );

    final semantics = tester.widget<AppSemantics>(find.byType(AppSemantics));
    expect(semantics.label, ''); // default
    expect(semantics.isSelected, false); // default
  });
}

import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MenuItem displays the correct text', (WidgetTester tester) async {
    const testText = 'Menu Option';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: MenuItem(text: testText)),
      ),
    );

    // Verify the Text widget is present and displays the correct text
    expect(find.text(testText), findsOneWidget);
  });

  testWidgets('MenuItem applies correct padding', (WidgetTester tester) async {
    const testText = 'Menu Option';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: MenuItem(text: testText)),
      ),
    );

    // Find the Padding widget
    final paddingFinder = find.byType(Padding);
    expect(paddingFinder, findsOneWidget);

    final paddingWidget = tester.widget<Padding>(paddingFinder);
    expect(paddingWidget.padding, const EdgeInsets.all(AppDimensions.minorL));
  });
}

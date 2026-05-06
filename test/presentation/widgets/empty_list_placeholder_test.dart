import 'package:blogify_flutter_main/common/app_text_styles.dart';
import 'package:blogify_flutter_main/presentation/widgets/empty_list_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('EmptyListPlaceholder displays the correct text and style', (
    WidgetTester tester,
  ) async {
    const testText = 'No items found';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: EmptyListPlaceholder(text: testText)),
      ),
    );

    // Verify the Text widget is present
    final textFinder = find.text(testText);
    expect(textFinder, findsOneWidget);

    // Verify the style
    final textWidget = tester.widget<Text>(textFinder);
    expect(textWidget.style, AppTextStyles.sfPro16);
  });
}

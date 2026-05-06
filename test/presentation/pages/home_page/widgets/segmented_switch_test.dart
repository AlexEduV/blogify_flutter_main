import 'package:blogify_flutter_main/common/app_colors.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/segmented_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SegmentedSwitch', () {
    testWidgets('displays all options', (WidgetTester tester) async {
      final options = ['A', 'B', 'C'];
      await tester.pumpWidget(
        MaterialApp(
          home: SegmentedSwitch(
            selectedIndex: 0,
            previousIndex: 0,
            options: options,
            onChanged: (_) {},
          ),
        ),
      );

      for (final option in options) {
        expect(find.text(option), findsOneWidget);
      }
    });

    testWidgets('highlights the selected option', (WidgetTester tester) async {
      final options = ['One', 'Two', 'Three'];
      await tester.pumpWidget(
        MaterialApp(
          home: SegmentedSwitch(
            selectedIndex: 1,
            previousIndex: 0,
            options: options,
            onChanged: (_) {},
          ),
        ),
      );

      final selectedText = tester.widget<AnimatedDefaultTextStyle>(
        find.ancestor(of: find.text('Two'), matching: find.byType(AnimatedDefaultTextStyle)).first,
      );
      expect(selectedText.style.color, Colors.white);

      final unselectedText = tester.widget<AnimatedDefaultTextStyle>(
        find.ancestor(of: find.text('One'), matching: find.byType(AnimatedDefaultTextStyle)).first,
      );
      expect(unselectedText.style.color, AppColors.dark);
    });

    testWidgets('calls onChanged with correct index when tapped', (WidgetTester tester) async {
      final options = ['X', 'Y', 'Z'];
      int? tappedIndex;
      await tester.pumpWidget(
        MaterialApp(
          home: SegmentedSwitch(
            selectedIndex: 0,
            previousIndex: 0,
            options: options,
            onChanged: (index) {
              tappedIndex = index;
            },
          ),
        ),
      );

      await tester.tap(find.text('Y'));
      expect(tappedIndex, 1);

      await tester.tap(find.text('Z'));
      expect(tappedIndex, 2);
    });
  });
}

import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('RoundedButton displays text', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: RoundedButton(text: 'Hello')),
      ),
    );
    expect(find.text('Hello'), findsOneWidget);
  });

  testWidgets('RoundedButton displays leading and trailing icons', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RoundedButton(
            text: 'Hello',
            leadingIcon: Icons.add,
            trailingIcon: Icons.arrow_drop_down,
          ),
        ),
      ),
    );
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.byIcon(Icons.arrow_drop_down), findsOneWidget);
  });

  testWidgets('RoundedButton triggers onTap', (tester) async {
    bool tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RoundedButton(text: 'Hello', onTap: () => tapped = true),
        ),
      ),
    );
    await tester.tap(find.byType(RoundedButton));
    expect(tapped, isTrue);
  });

  testWidgets('RoundedButton applies selected and unselected colors', (tester) async {
    // Selected
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RoundedButton(
            text: 'Selected',
            selected: true,
            selectedColor: Colors.red,
            unselectedColor: Colors.blue,
          ),
        ),
      ),
    );
    final material = tester.widget<Material>(find.byType(Material).last);
    expect(material.color, Colors.red);

    // Unselected
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RoundedButton(
            text: 'Unselected',
            selected: false,
            selectedColor: Colors.red,
            unselectedColor: Colors.blue,
          ),
        ),
      ),
    );
    final material2 = tester.widget<Material>(find.byType(Material).last);
    expect(material2.color, Colors.blue);
  });

  testWidgets('RoundedButton applies correct border radius and padding', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: RoundedButton(text: 'Hello', borderRadius: 16, horizontalPadding: 24)),
      ),
    );
    final material = tester.widget<Material>(find.byType(Material).last);
    expect((material.borderRadius as BorderRadius).topLeft.x, 16);

    final padding = tester.widget<Padding>(find.byType(Padding));
    final paddingValue = padding.padding as EdgeInsets;
    expect(paddingValue.horizontal, 48); // 24 left + 24 right
    expect(paddingValue.vertical, AppDimensions.minorL * 2);
  });

  testWidgets('RoundedButton trailing icon rotates when expanded', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: RoundedButton(text: 'Hello', trailingIcon: Icons.arrow_drop_down, expanded: true),
        ),
      ),
    );
    final animatedRotation = tester.widget<AnimatedRotation>(find.byType(AnimatedRotation));
    expect(animatedRotation.turns, -360 / 360); // -360.toTurns
  });

  testWidgets('RoundedButton text style changes when selected', (tester) async {
    // Selected
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: RoundedButton(text: 'Selected', selected: true)),
      ),
    );
    final textWidget = tester.widget<Text>(find.text('Selected'));
    final style = textWidget.style!;
    expect(style.fontWeight, FontWeight.w600);

    // Unselected
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: RoundedButton(text: 'Unselected', selected: false)),
      ),
    );
    final textWidget2 = tester.widget<Text>(find.text('Unselected'));
    final style2 = textWidget2.style!;
    expect(style2.fontWeight, FontWeight.w500);
  });
}

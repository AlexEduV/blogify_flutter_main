import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/domain/entities/user_entity.dart';
import 'package:blogify_flutter_main/l10n/l10n.dart';
import 'package:blogify_flutter_main/presentation/notifiers/user/user_data_notifier.dart';
import 'package:blogify_flutter_main/presentation/pages/home_page/widgets/user_welcome_row.dart';
import 'package:blogify_flutter_main/presentation/widgets/user_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class MockUserDataNotifier extends Mock implements UserDataNotifier {}

void main() {
  late MockUserDataNotifier mockNotifier;

  setUp(() {
    mockNotifier = MockUserDataNotifier();
    // Mock user data
    when(
      () => mockNotifier.user,
    ).thenReturn(UserEntity.empty().copyWith(firstName: 'Alice', imageSrc: ''));
    // If your User class is different, adjust accordingly
  });

  Widget buildTestable({required Widget child}) {
    return ChangeNotifierProvider<UserDataNotifier>.value(
      value: mockNotifier,
      child: MaterialApp(home: Scaffold(body: child)),
    );
  }

  testWidgets('displays welcome label, subtitle, and user first name', (tester) async {
    await tester.pumpWidget(buildTestable(child: const UserWelcomeRow()));

    expect(find.text(L10n.welcomeScreenLabel), findsOneWidget);
    expect(find.text(L10n.welcomeScreenSubtitle), findsOneWidget);
    expect(find.text('Alice'), findsOneWidget);
  });

  testWidgets('displays user image in UserPhoto', (tester) async {
    await tester.pumpWidget(buildTestable(child: const UserWelcomeRow()));

    final userPhoto = tester.widget<UserPhoto>(find.byType(UserPhoto));
    expect(userPhoto.imageSrc, '');
    expect(userPhoto.size, AppDimensions.appBarUserAvatarImageSize);
  });

  testWidgets('tapping UserPhoto triggers navigation', (tester) async {
    bool pushed = false;

    // Mock router context
    final testKey = GlobalKey();
    await tester.pumpWidget(
      buildTestable(
        child: Builder(
          builder: (context) {
            return UserPhoto(
              key: testKey,
              imageSrc: '',
              size: AppDimensions.appBarUserAvatarImageSize,
              onTap: () {
                pushed = true;
              },
            );
          },
        ),
      ),
    );

    await tester.tap(find.byKey(testKey));
    expect(pushed, isTrue);
  });
}

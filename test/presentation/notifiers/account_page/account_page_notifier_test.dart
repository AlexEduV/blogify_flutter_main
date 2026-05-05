import 'package:blogify_flutter_main/domain/usecases/image_picker/pick_image_use_case.dart';
import 'package:blogify_flutter_main/presentation/notifiers/account_page/account_page_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPickImageUseCase extends Mock implements PickImageUseCase {}

void main() {
  group('AccountPageNotifier', () {
    late MockPickImageUseCase mockPickImageUseCase;
    late AccountPageNotifier notifier;

    setUp(() {
      mockPickImageUseCase = MockPickImageUseCase();
      notifier = AccountPageNotifier(mockPickImageUseCase);
    });

    test('getNewUserImageSrc delegates to PickImageUseCase and returns file path', () async {
      when(() => mockPickImageUseCase.call()).thenAnswer((_) async => '/path/to/image.png');

      final result = await notifier.getNewUserImageSrc();

      expect(result, '/path/to/image.png');
      verify(() => mockPickImageUseCase.call()).called(1);
    });

    test('getNewUserImageSrc delegates to PickImageUseCase and returns null', () async {
      when(() => mockPickImageUseCase.call()).thenAnswer((_) async => null);

      final result = await notifier.getNewUserImageSrc();

      expect(result, isNull);
      verify(() => mockPickImageUseCase.call()).called(1);
    });
  });
}

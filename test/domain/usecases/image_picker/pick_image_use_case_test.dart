import 'package:blogify_flutter_main/domain/repositories/image_picker_repository.dart';
import 'package:blogify_flutter_main/domain/usecases/image_picker/pick_image_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockImagePickerRepository extends Mock implements ImagePickerRepository {}

void main() {
  group('PickImageUseCase', () {
    late MockImagePickerRepository mockRepository;
    late PickImageUseCase useCase;

    setUp(() {
      mockRepository = MockImagePickerRepository();
      useCase = PickImageUseCase(mockRepository);
    });

    test('calls pickImage on repository and returns the result', () async {
      // Arrange
      when(() => mockRepository.pickImage()).thenAnswer((_) async => 'image_path.png');

      // Act
      final result = await useCase();

      // Assert
      expect(result, 'image_path.png');
      verify(() => mockRepository.pickImage()).called(1);
    });

    test('returns null if repository returns null', () async {
      // Arrange
      when(() => mockRepository.pickImage()).thenAnswer((_) async => null);

      // Act
      final result = await useCase();

      // Assert
      expect(result, isNull);
      verify(() => mockRepository.pickImage()).called(1);
    });
  });
}

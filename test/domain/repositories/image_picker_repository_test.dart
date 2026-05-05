import 'package:blogify_flutter_main/domain/repositories/image_picker_repository.dart'; // Update with actual path
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockImagePickerRepository extends Mock implements ImagePickerRepository {}

void main() {
  group('ImagePickerRepository', () {
    late MockImagePickerRepository mockRepository;

    setUp(() {
      mockRepository = MockImagePickerRepository();
    });

    test('pickImage returns a file path', () async {
      when(() => mockRepository.pickImage()).thenAnswer((_) async => '/path/to/image.png');

      final result = await mockRepository.pickImage();

      expect(result, '/path/to/image.png');
      verify(() => mockRepository.pickImage()).called(1);
    });

    test('pickImage returns null when no image is picked', () async {
      when(() => mockRepository.pickImage()).thenAnswer((_) async => null);

      final result = await mockRepository.pickImage();

      expect(result, isNull);
      verify(() => mockRepository.pickImage()).called(1);
    });
  });
}

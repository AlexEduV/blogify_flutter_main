import 'package:blogify_flutter_main/domain/data_sources/local/image_picker_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockImagePickerLocalDataSource extends Mock implements ImagePickerLocalDataSource {}

void main() {
  group('ImagePickerLocalDataSource', () {
    late MockImagePickerLocalDataSource mockDataSource;

    setUp(() {
      mockDataSource = MockImagePickerLocalDataSource();
    });

    test('pickImage returns a file path', () async {
      when(() => mockDataSource.pickImage()).thenAnswer((_) async => '/path/to/image.png');

      final result = await mockDataSource.pickImage();

      expect(result, '/path/to/image.png');
      verify(() => mockDataSource.pickImage()).called(1);
    });

    test('pickImage returns null when no image is picked', () async {
      when(() => mockDataSource.pickImage()).thenAnswer((_) async => null);

      final result = await mockDataSource.pickImage();

      expect(result, isNull);
      verify(() => mockDataSource.pickImage()).called(1);
    });
  });
}

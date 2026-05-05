import 'package:blogify_flutter_main/data/repositories/image_picker_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../domain/data_sources/local/image_picker_local_data_source_test.dart'; // Update with actual path

void main() {
  group('ImagePickerRepositoryImpl', () {
    late MockImagePickerLocalDataSource mockDataSource;
    late ImagePickerRepositoryImpl repository;

    setUp(() {
      mockDataSource = MockImagePickerLocalDataSource();
      repository = ImagePickerRepositoryImpl(mockDataSource);
    });

    test('pickImage delegates to local data source and returns file path', () async {
      when(() => mockDataSource.pickImage()).thenAnswer((_) async => '/path/to/image.png');

      final result = await repository.pickImage();

      expect(result, '/path/to/image.png');
      verify(() => mockDataSource.pickImage()).called(1);
    });

    test('pickImage delegates to local data source and returns null', () async {
      when(() => mockDataSource.pickImage()).thenAnswer((_) async => null);

      final result = await repository.pickImage();

      expect(result, isNull);
      verify(() => mockDataSource.pickImage()).called(1);
    });
  });
}

import 'package:blogify_flutter_main/domain/models/share_params_model.dart';
import 'package:blogify_flutter_main/domain/repositories/share_repository.dart';
import 'package:blogify_flutter_main/domain/usecases/share/share_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockShareRepository extends Mock implements ShareRepository {}

void main() {
  group('ShareUseCase', () {
    late MockShareRepository mockRepository;
    late ShareUseCase useCase;

    setUp(() {
      mockRepository = MockShareRepository();
      useCase = ShareUseCase(mockRepository);
    });

    test('calls share on repository with correct params', () async {
      // Arrange
      final params = ShareParamsModel(title: 'title', text: 'text');
      when(() => mockRepository.share(params)).thenAnswer((_) async {});

      // Act
      await useCase(params);

      // Assert
      verify(() => mockRepository.share(params)).called(1);
    });
  });
}

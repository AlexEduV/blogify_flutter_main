import 'package:blogify_flutter_main/domain/usecases/comments/init_comments_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'get_all_comments_use_case_test.dart';

void main() {
  group('InitCommentsUseCase', () {
    late MockCommentsRepository mockRepository;
    late InitCommentsUseCase useCase;

    setUp(() {
      mockRepository = MockCommentsRepository();
      useCase = InitCommentsUseCase(mockRepository);
    });

    test('calls init on repository', () {
      // Arrange
      when(() => mockRepository.init()).thenReturn(null);

      // Act
      useCase();

      // Assert
      verify(() => mockRepository.init()).called(1);
    });
  });
}

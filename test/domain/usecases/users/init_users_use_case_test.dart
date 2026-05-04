import 'package:blogify_flutter_main/domain/usecases/users/init_users_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'get_all_users_use_case_test.dart';

void main() {
  group('InitUsersUseCase', () {
    late MockUsersRepository mockRepository;
    late InitUsersUseCase useCase;

    setUp(() {
      mockRepository = MockUsersRepository();
      useCase = InitUsersUseCase(mockRepository);
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

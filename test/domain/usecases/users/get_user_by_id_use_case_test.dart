import 'package:blogify_flutter_main/domain/entities/user_entity.dart';
import 'package:blogify_flutter_main/domain/usecases/users/get_user_by_id_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'get_all_users_use_case_test.dart';

void main() {
  group('GetUserByIdUseCase', () {
    late MockUsersRepository mockRepository;
    late GetUserByIdUseCase useCase;

    setUp(() {
      mockRepository = MockUsersRepository();
      useCase = GetUserByIdUseCase(mockRepository);
    });

    test('calls getUserEntityById on repository and returns the result', () {
      // Arrange
      const user = UserEntity(
        id: 1,
        firstName: 'John',
        lastName: 'Doe',
        email: 'john.doe@example.com',
        imageSrc: 'img1.png',
      );
      when(() => mockRepository.getUserEntityById(1)).thenReturn(user);

      // Act
      final result = useCase(1);

      // Assert
      expect(result, user);
      verify(() => mockRepository.getUserEntityById(1)).called(1);
    });
  });
}

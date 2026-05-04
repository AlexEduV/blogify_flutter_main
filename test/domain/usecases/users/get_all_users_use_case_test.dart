import 'package:blogify_flutter_main/domain/entities/user_entity.dart';
import 'package:blogify_flutter_main/domain/repositories/users_repository.dart';
import 'package:blogify_flutter_main/domain/usecases/users/get_all_users_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUsersRepository extends Mock implements UsersRepository {}

void main() {
  group('GetAllUsersUseCase', () {
    late MockUsersRepository mockRepository;
    late GetAllUsersUseCase useCase;

    setUp(() {
      mockRepository = MockUsersRepository();
      useCase = GetAllUsersUseCase(mockRepository);
    });

    test('calls getAllUsers on repository and returns the result', () {
      // Arrange
      final users = [
        const UserEntity(
          id: 1,
          firstName: 'John',
          lastName: 'Doe',
          email: 'john.doe@example.com',
          imageSrc: 'img1.png',
        ),
        const UserEntity(
          id: 2,
          firstName: 'Jane',
          lastName: 'Smith',
          email: 'jane.smith@example.com',
          imageSrc: 'img2.png',
        ),
      ];
      when(() => mockRepository.getAllUsers()).thenReturn(users);

      // Act
      final result = useCase();

      // Assert
      expect(result, users);
      verify(() => mockRepository.getAllUsers()).called(1);
    });

    test('returns empty list if repository returns empty', () {
      // Arrange
      when(() => mockRepository.getAllUsers()).thenReturn([]);

      // Act
      final result = useCase();

      // Assert
      expect(result, isEmpty);
      verify(() => mockRepository.getAllUsers()).called(1);
    });
  });
}

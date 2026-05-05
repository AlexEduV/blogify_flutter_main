import 'package:blogify_flutter_main/domain/entities/user_entity.dart';
import 'package:blogify_flutter_main/domain/repositories/users_repository.dart'; // Update with actual path
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUsersRepository extends Mock implements UsersRepository {}

void main() {
  group('UsersRepository', () {
    late MockUsersRepository mockRepository;

    setUp(() {
      mockRepository = MockUsersRepository();
    });

    test('init can be called', () {
      when(() => mockRepository.init()).thenReturn(null);

      mockRepository.init();

      verify(() => mockRepository.init()).called(1);
    });

    test('getAllUsers returns expected users', () {
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

      final result = mockRepository.getAllUsers();

      expect(result, users);
      verify(() => mockRepository.getAllUsers()).called(1);
    });

    test('getUserEntityById returns expected user', () {
      const user = UserEntity(
        id: 1,
        firstName: 'John',
        lastName: 'Doe',
        email: 'john.doe@example.com',
        imageSrc: 'img1.png',
      );
      when(() => mockRepository.getUserEntityById(1)).thenReturn(user);

      final result = mockRepository.getUserEntityById(1);

      expect(result, user);
      verify(() => mockRepository.getUserEntityById(1)).called(1);
    });
  });
}

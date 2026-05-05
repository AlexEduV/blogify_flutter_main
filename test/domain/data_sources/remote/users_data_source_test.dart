import 'package:blogify_flutter_main/domain/data_sources/remote/users_data_source.dart';
import 'package:blogify_flutter_main/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUsersDataSource extends Mock implements UsersDataSource {}

void main() {
  group('UsersDataSource', () {
    late MockUsersDataSource mockDataSource;

    setUp(() {
      mockDataSource = MockUsersDataSource();
    });

    test('init can be called', () {
      when(() => mockDataSource.init()).thenReturn(null);

      mockDataSource.init();

      verify(() => mockDataSource.init()).called(1);
    });

    test('getUserEntityById returns expected user', () {
      const user = UserEntity(
        id: 1,
        firstName: 'John',
        lastName: 'Doe',
        email: 'john.doe@example.com',
        imageSrc: 'img1.png',
      );
      when(() => mockDataSource.getUserEntityById(1)).thenReturn(user);

      final result = mockDataSource.getUserEntityById(1);

      expect(result, user);
      verify(() => mockDataSource.getUserEntityById(1)).called(1);
    });
  });
}

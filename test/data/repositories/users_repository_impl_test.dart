import 'package:blogify_flutter_main/data/repositories/users_repository_impl.dart';
import 'package:blogify_flutter_main/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../domain/data_sources/remote/users_data_source_test.dart'; // Update with actual path

void main() {
  group('UsersRepositoryImpl', () {
    late MockUsersDataSource mockDataSource;
    late UsersRepositoryImpl repository;

    setUp(() {
      mockDataSource = MockUsersDataSource();
      repository = UsersRepositoryImpl(mockDataSource);
    });

    test('getUserEntityById delegates to data source', () {
      const user = UserEntity(
        id: 2,
        firstName: 'Jane',
        lastName: 'Smith',
        email: 'jane.smith@example.com',
        imageSrc: 'img2.png',
      );
      when(() => mockDataSource.getUserEntityById(2)).thenReturn(user);

      final result = repository.getUserEntityById(2);

      expect(result, user);
      verify(() => mockDataSource.getUserEntityById(2)).called(1);
    });

    test('init delegates to data source', () {
      when(() => mockDataSource.init()).thenReturn(null);

      repository.init();

      verify(() => mockDataSource.init()).called(1);
    });
  });
}

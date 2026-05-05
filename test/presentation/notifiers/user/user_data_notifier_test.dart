import 'package:blogify_flutter_main/data/database/database_manager.dart';
import 'package:blogify_flutter_main/domain/entities/user_entity.dart';
import 'package:blogify_flutter_main/domain/usecases/users/get_user_by_id_use_case.dart';
import 'package:blogify_flutter_main/presentation/notifiers/user/user_data_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetUserByIdUseCase extends Mock implements GetUserByIdUseCase {}

class MockDatabaseManager extends Mock implements DatabaseManager {}

void main() {
  group('UserDataNotifier', () {
    late MockGetUserByIdUseCase mockGetUserByIdUseCase;
    late MockDatabaseManager mockDatabaseManager;
    late UserDataNotifier notifier;

    setUp(() {
      mockGetUserByIdUseCase = MockGetUserByIdUseCase();
      mockDatabaseManager = MockDatabaseManager();
      notifier = UserDataNotifier(mockGetUserByIdUseCase, mockDatabaseManager);
    });

    test('init sets user from database and notifies listeners', () async {
      final userEntity = const UserEntity(
        id: 1,
        firstName: 'John',
        lastName: 'Doe',
        email: 'john.doe@example.com',
        imageSrc: 'img1.png',
      );
      when(() => mockDatabaseManager.getUser()).thenAnswer((_) async => userEntity);

      var notified = false;
      notifier.addListener(() {
        notified = true;
      });

      await notifier.init();

      expect(notifier.user, userEntity);
      expect(notified, true);
      verify(() => mockDatabaseManager.getUser()).called(1);
    });

    test('init fetches from cloud and inserts if database returns null', () async {
      when(() => mockDatabaseManager.getUser()).thenAnswer((_) async => null);

      final userFromCloud = const UserEntity(
        id: 1,
        firstName: 'Cloud',
        lastName: 'User',
        email: 'cloud.user@example.com',
        imageSrc: 'img2.png',
      );
      when(() => mockGetUserByIdUseCase.call(1)).thenReturn(userFromCloud);
      when(() => mockDatabaseManager.insertUser(userFromCloud)).thenAnswer((_) async {});

      var notified = false;
      notifier.addListener(() {
        notified = true;
      });

      await notifier.init();

      expect(notifier.user, userFromCloud);
      expect(notified, true);
      verify(() => mockDatabaseManager.getUser()).called(1);
      verify(() => mockGetUserByIdUseCase.call(1)).called(1);
      verify(() => mockDatabaseManager.insertUser(userFromCloud)).called(1);
    });

    test('updateUser sets user, updates database, and notifies listeners', () async {
      final updatedUser = const UserEntity(
        id: 2,
        firstName: 'Jane',
        lastName: 'Smith',
        email: 'jane.smith@example.com',
        imageSrc: 'img3.png',
      );
      when(() => mockDatabaseManager.updateUser(updatedUser)).thenAnswer((_) async {});

      var notified = false;
      notifier.addListener(() {
        notified = true;
      });

      await notifier.updateUser(updatedUser);

      expect(notifier.user, updatedUser);
      expect(notified, true);
      verify(() => mockDatabaseManager.updateUser(updatedUser)).called(1);
    });
  });
}

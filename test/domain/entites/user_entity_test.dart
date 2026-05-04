import 'package:blogify_flutter_main/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserEntity', () {
    test('constructor assigns all fields correctly', () {
      const user = UserEntity(
        id: 1,
        firstName: 'John',
        lastName: 'Doe',
        email: 'john.doe@example.com',
        imageSrc: 'img.png',
      );

      expect(user.id, 1);
      expect(user.firstName, 'John');
      expect(user.lastName, 'Doe');
      expect(user.email, 'john.doe@example.com');
      expect(user.imageSrc, 'img.png');
    });

    test('empty factory returns correct default values', () {
      final user = UserEntity.empty();
      expect(user.id, 0);
      expect(user.firstName, 'Test');
      expect(user.lastName, 'User');
      expect(user.email, 'test@test.com');
      expect(user.imageSrc, '');
    });

    test('toMap returns correct map', () {
      const user = UserEntity(
        id: 2,
        firstName: 'Alice',
        lastName: 'Smith',
        email: 'alice@example.com',
        imageSrc: 'alice.png',
      );

      final map = user.toMap();
      expect(map, {
        'id': 2,
        'firstName': 'Alice',
        'lastName': 'Smith',
        'email': 'alice@example.com',
        'imageSrc': 'alice.png',
      });
    });

    test('fromMap creates correct UserEntity', () {
      final map = {
        'id': 3,
        'firstName': 'Bob',
        'lastName': 'Brown',
        'email': 'bob@example.com',
        'imageSrc': 'bob.png',
      };

      final user = UserEntity.fromMap(map);
      expect(user.id, 3);
      expect(user.firstName, 'Bob');
      expect(user.lastName, 'Brown');
      expect(user.email, 'bob@example.com');
      expect(user.imageSrc, 'bob.png');
    });

    test('copyWith returns a new instance with updated fields', () {
      const user = UserEntity(
        id: 4,
        firstName: 'Carol',
        lastName: 'White',
        email: 'carol@example.com',
        imageSrc: 'carol.png',
      );

      final updated = user.copyWith(firstName: 'Caroline', email: 'caroline@example.com');

      expect(updated.id, 4);
      expect(updated.firstName, 'Caroline');
      expect(updated.lastName, 'White');
      expect(updated.email, 'caroline@example.com');
      expect(updated.imageSrc, 'carol.png');
    });

    test('equality and hashCode', () {
      const user1 = UserEntity(
        id: 5,
        firstName: 'Dan',
        lastName: 'Black',
        email: 'dan@example.com',
        imageSrc: 'dan.png',
      );
      const user2 = UserEntity(
        id: 5,
        firstName: 'Dan',
        lastName: 'Black',
        email: 'dan@example.com',
        imageSrc: 'dan.png',
      );
      const user3 = UserEntity(
        id: 6,
        firstName: 'Eve',
        lastName: 'Green',
        email: 'eve@example.com',
        imageSrc: 'eve.png',
      );

      expect(user1, equals(user2));
      expect(user1.hashCode, equals(user2.hashCode));
      expect(user1, isNot(equals(user3)));
      expect(user1.hashCode, isNot(equals(user3.hashCode)));
    });
  });
}

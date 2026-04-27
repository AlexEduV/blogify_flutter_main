import 'package:blogify_flutter_main/domain/data_sources/users_data_source.dart';
import 'package:blogify_flutter_main/domain/entities/user_entity.dart';

class MockUsersDataSourceImpl implements UsersDataSource {
  @override
  List<UserEntity> users = [];

  @override
  void init() {
    users = [
      const UserEntity(
          id: 2, firstName: 'Alex', lastName: 'McKey', email: 'alexmckey@gmail.com', imageSrc: ''),
      const UserEntity(
          id: 3, firstName: 'Tom', lastName: 'Noble', email: 'tomnb23@gmail.com', imageSrc: ''),
      const UserEntity(
          id: 4, firstName: 'Marney', lastName: 'March', email: 'mmarch@gmail.com', imageSrc: ''),
      const UserEntity(
        id: 1,
        firstName: 'Jude',
        lastName: 'Adams',
        email: 'therealjude@gmail.com',
        imageSrc: 'assets/images/profile-image.jpg',
      )
    ];
  }

  @override
  UserEntity getUserEntityById(int id) {
    return users.firstWhere((user) => user.id == id, orElse: () => UserEntity.empty());
  }
}

import '../entities/user_entity.dart';

abstract class UsersDataSource {
  late List<UserEntity> users;

  void init();

  UserEntity getUserEntityById(int id);
}

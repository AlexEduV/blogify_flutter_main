import 'package:blogify_flutter_main/domain/entities/user_entity.dart';

abstract class UsersRepository {
  void init();

  List<UserEntity> getAllUsers();

  UserEntity getUserEntityById(int id);
}

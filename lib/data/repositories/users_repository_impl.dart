import 'package:blogify_flutter_main/domain/data_sources/remote/users_data_source.dart';
import 'package:blogify_flutter_main/domain/entities/user_entity.dart';
import 'package:blogify_flutter_main/domain/repositories/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersDataSource _usersDataSource;

  UsersRepositoryImpl(this._usersDataSource);

  @override
  List<UserEntity> getAllUsers() {
    return _usersDataSource.users;
  }

  @override
  UserEntity getUserEntityById(int id) {
    return _usersDataSource.getUserEntityById(id);
  }

  @override
  void init() {
    return _usersDataSource.init();
  }
}

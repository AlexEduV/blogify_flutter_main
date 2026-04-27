import 'package:blogify_flutter_main/domain/data_sources/users_data_source.dart';
import 'package:blogify_flutter_main/domain/entities/user_entity.dart';
import 'package:flutter/cupertino.dart';

class UserDataNotifier extends ChangeNotifier {
  final UsersDataSource _usersDataSource;

  UserDataNotifier(this._usersDataSource);

  late UserEntity user;

  void init() {
    user = _usersDataSource.getUserEntityById(1);
  }
}

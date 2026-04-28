import 'package:blogify_flutter_main/data/database/database_manager.dart';
import 'package:blogify_flutter_main/domain/data_sources/users_data_source.dart';
import 'package:blogify_flutter_main/domain/entities/user_entity.dart';
import 'package:flutter/cupertino.dart';

class UserDataNotifier extends ChangeNotifier {
  final UsersDataSource _usersDataSource;
  final DatabaseManager _databaseManager;

  UserDataNotifier(this._usersDataSource, this._databaseManager);

  late UserEntity user;

  Future<void> init() async {
    final userEntity = await _databaseManager.getUser();
    if (userEntity == null) {
      final userFromCloud = _usersDataSource.getUserEntityById(1);
      await _databaseManager.insertUser(userFromCloud);
      user = userFromCloud;
      notifyListeners();

      return;
    }

    user = userEntity;
    notifyListeners();
  }
}

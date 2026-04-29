import 'package:blogify_flutter_main/data/database/database_manager.dart';
import 'package:blogify_flutter_main/domain/entities/user_entity.dart';
import 'package:blogify_flutter_main/domain/usecases/users/get_user_by_id_use_case.dart';
import 'package:flutter/cupertino.dart';

class UserDataNotifier extends ChangeNotifier {
  final GetUserByIdUseCase _getUserByIdUseCase;
  final DatabaseManager _databaseManager;

  UserDataNotifier(this._getUserByIdUseCase, this._databaseManager);

  late UserEntity user;

  Future<void> init() async {
    final userEntity = await _databaseManager.getUser();
    if (userEntity == null) {
      final userFromCloud = _getUserByIdUseCase.call(1);
      await _databaseManager.insertUser(userFromCloud);
      user = userFromCloud;
      notifyListeners();

      return;
    }

    user = userEntity;
    notifyListeners();
  }

  Future<void> updateUser(UserEntity userEntity) async {
    user = userEntity;
    await _databaseManager.updateUser(user);

    notifyListeners();
  }
}

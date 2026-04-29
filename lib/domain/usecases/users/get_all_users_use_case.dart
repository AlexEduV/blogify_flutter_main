import 'package:blogify_flutter_main/domain/entities/user_entity.dart';
import 'package:blogify_flutter_main/domain/repositories/users_repository.dart';
import 'package:blogify_flutter_main/domain/usecases/usecase.dart';

class GetAllUsersUseCase implements UseCaseNoParams<List<UserEntity>> {
  final UsersRepository _usersRepository;

  GetAllUsersUseCase(this._usersRepository);

  @override
  List<UserEntity> call() {
    return _usersRepository.getAllUsers();
  }
}

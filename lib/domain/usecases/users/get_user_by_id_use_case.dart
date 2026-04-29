import 'package:blogify_flutter_main/domain/entities/user_entity.dart';
import 'package:blogify_flutter_main/domain/repositories/users_repository.dart';
import 'package:blogify_flutter_main/domain/usecases/usecase.dart';

class GetUserByIdUseCase implements UseCaseWithParams<int, UserEntity> {
  final UsersRepository _usersRepository;

  GetUserByIdUseCase(this._usersRepository);

  @override
  UserEntity call(int id) {
    return _usersRepository.getUserEntityById(id);
  }
}

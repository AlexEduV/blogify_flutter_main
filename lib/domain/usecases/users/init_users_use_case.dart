import 'package:blogify_flutter_main/domain/repositories/users_repository.dart';
import 'package:blogify_flutter_main/domain/usecases/usecase.dart';

class InitUsersUseCase implements UseCaseNoParams<void> {
  final UsersRepository _usersRepository;

  InitUsersUseCase(this._usersRepository);

  @override
  void call() {
    return _usersRepository.init();
  }
}

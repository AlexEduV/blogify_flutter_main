import 'package:blogify_flutter_main/domain/models/share_params_model.dart';
import 'package:blogify_flutter_main/domain/repositories/share_repository.dart';
import 'package:blogify_flutter_main/domain/usecases/usecase.dart';

class ShareUseCase implements UseCaseWithParams<ShareParamsModel, Future<void>> {
  final ShareRepository _shareRepository;

  ShareUseCase(this._shareRepository);

  @override
  Future<void> call(ShareParamsModel params) {
    return _shareRepository.share(params);
  }
}

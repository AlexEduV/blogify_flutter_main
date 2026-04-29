import 'package:blogify_flutter_main/domain/data_sources/local/share_local_data_source.dart';
import 'package:blogify_flutter_main/domain/models/share_params_model.dart';
import 'package:blogify_flutter_main/domain/repositories/share_repository.dart';

class ShareRepositoryImpl implements ShareRepository {
  final ShareLocalDataSource _shareLocalDataSource;

  ShareRepositoryImpl(this._shareLocalDataSource);

  @override
  Future<void> share(ShareParamsModel model) {
    return _shareLocalDataSource.share(model);
  }
}

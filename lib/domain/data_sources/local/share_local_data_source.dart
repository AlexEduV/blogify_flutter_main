import '../../models/share_params_model.dart';

abstract class ShareLocalDataSource {
  Future<void> share(ShareParamsModel model);
}

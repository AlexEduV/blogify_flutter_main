import 'package:blogify_flutter_main/domain/data_sources/local/share_local_data_source.dart';
import 'package:blogify_flutter_main/domain/models/share_params_model.dart';
import 'package:share_plus/share_plus.dart';

class ShareLocalDataSourceImpl implements ShareLocalDataSource {
  @override
  Future<void> share(ShareParamsModel model) async {
    SharePlus.instance.share(model.toShareParams());
  }
}

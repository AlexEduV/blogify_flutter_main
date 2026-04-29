import 'package:blogify_flutter_main/domain/repositories/image_picker_repository.dart';

import '../../domain/data_sources/local/image_picker_local_data_source.dart';

class ImagePickerRepositoryImpl implements ImagePickerRepository {
  final ImagePickerLocalDataSource _imagePickerLocalDataSource;

  ImagePickerRepositoryImpl(this._imagePickerLocalDataSource);

  @override
  Future<String?> pickImage() {
    return _imagePickerLocalDataSource.pickImage();
  }
}

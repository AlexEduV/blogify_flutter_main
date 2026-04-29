import 'package:image_picker/image_picker.dart';

import '../../../domain/data_sources/local/image_picker_local_data_source.dart';

class ImagePickerLocalDataSourceImpl implements ImagePickerLocalDataSource {
  final ImagePicker _imagePicker;

  ImagePickerLocalDataSourceImpl(this._imagePicker);

  @override
  Future<String?> pickImage() async {
    final file = await _imagePicker.pickImage(source: ImageSource.gallery);
    return file?.path;
  }
}

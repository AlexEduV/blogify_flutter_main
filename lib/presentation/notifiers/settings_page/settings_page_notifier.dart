import 'package:blogify_flutter_main/domain/usecases/image_picker/pick_image_use_case.dart';
import 'package:flutter/cupertino.dart';

class SettingsPageNotifier extends ChangeNotifier {
  final PickImageUseCase _pickImageUseCase;

  SettingsPageNotifier(this._pickImageUseCase);

  Future<String?> getNewUserImageSrc() {
    return _pickImageUseCase.call();
  }
}

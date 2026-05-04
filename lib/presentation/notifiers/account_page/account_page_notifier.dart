import 'package:blogify_flutter_main/domain/usecases/image_picker/pick_image_use_case.dart';
import 'package:flutter/cupertino.dart';

class AccountPageNotifier extends ChangeNotifier {
  final PickImageUseCase _pickImageUseCase;

  AccountPageNotifier(this._pickImageUseCase);

  Future<String?> getNewUserImageSrc() {
    return _pickImageUseCase.call();
  }
}

import 'package:blogify_flutter_main/domain/repositories/image_picker_repository.dart';
import 'package:blogify_flutter_main/domain/usecases/usecase.dart';

class PickImageUseCase implements UseCaseNoParams<Future<String?>> {
  final ImagePickerRepository _imagePickerRepository;

  PickImageUseCase(this._imagePickerRepository);

  @override
  Future<String?> call() {
    return _imagePickerRepository.pickImage();
  }
}

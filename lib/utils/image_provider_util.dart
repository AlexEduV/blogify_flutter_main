import 'dart:io' show File;

import 'package:flutter/cupertino.dart' show FileImage, ImageProvider, NetworkImage;

class ImageProviderUtil {
  static ImageProvider<Object>? getUserImageProvider(String imageSrc) {
    if (imageSrc.isEmpty) return null;

    if (imageSrc.startsWith('https://')) {
      return NetworkImage(imageSrc);
    }

    return FileImage(File(imageSrc));
  }
}

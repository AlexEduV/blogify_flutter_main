import 'package:blogify_flutter_main/utils/image_provider_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ImageProviderUtil.getUserImageProvider', () {
    test('returns null for empty imageSrc', () {
      final provider = ImageProviderUtil.getUserImageProvider('');
      expect(provider, isNull);
    });

    test('returns NetworkImage for https url', () {
      const url = 'https://example.com/image.png';
      final provider = ImageProviderUtil.getUserImageProvider(url);
      expect(provider, isA<NetworkImage>());
      expect((provider as NetworkImage).url, url);
    });

    test('returns FileImage for local file path', () {
      const filePath = '/path/to/image.png';
      final provider = ImageProviderUtil.getUserImageProvider(filePath);
      expect(provider, isA<FileImage>());
      expect((provider as FileImage).file.path, filePath);
    });
  });
}

import 'dart:ui';

import 'package:blogify_flutter_main/domain/models/share_params_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:share_plus/share_plus.dart';

class FakeXFile extends XFile {
  FakeXFile(super.path);
}

void main() {
  group('ShareParamsModel', () {
    test('constructor assigns all fields correctly', () {
      final rect = const Rect.fromLTWH(0, 0, 100, 100);
      final xFile = FakeXFile('test.png');
      final model = ShareParamsModel(
        title: 'Title',
        text: 'Text',
        sharePositionOrigin: rect,
        previewThumbnail: xFile,
      );

      expect(model.title, 'Title');
      expect(model.text, 'Text');
      expect(model.sharePositionOrigin, rect);
      expect(model.previewThumbnail, xFile);
    });

    test('copyWith returns a new instance with updated fields', () {
      final rect1 = const Rect.fromLTWH(0, 0, 100, 100);
      final rect2 = const Rect.fromLTWH(10, 10, 50, 50);
      final xFile1 = FakeXFile('a.png');
      final xFile2 = FakeXFile('b.png');
      final model = ShareParamsModel(
        title: 'A',
        text: 'B',
        sharePositionOrigin: rect1,
        previewThumbnail: xFile1,
      );

      final updated = model.copyWith(
        title: 'C',
        text: 'D',
        sharePositionOrigin: rect2,
        previewThumbnail: xFile2,
      );

      expect(updated.title, 'C');
      expect(updated.text, 'D');
      expect(updated.sharePositionOrigin, rect2);
      expect(updated.previewThumbnail, xFile2);

      // unchanged fields if not provided
      final unchanged = model.copyWith();
      expect(unchanged.title, 'A');
      expect(unchanged.text, 'B');
      expect(unchanged.sharePositionOrigin, rect1);
      expect(unchanged.previewThumbnail, xFile1);
    });

    test('toShareParams returns correct ShareParams', () {
      final rect = const Rect.fromLTWH(0, 0, 100, 100);
      final xFile = FakeXFile('test.png');
      final model = ShareParamsModel(
        title: 'Title',
        text: 'Text',
        sharePositionOrigin: rect,
        previewThumbnail: xFile,
      );

      final params = model.toShareParams();
      expect(params.title, 'Title');
      expect(params.text, 'Text');
      expect(params.sharePositionOrigin, rect);
      expect(params.previewThumbnail, xFile);
    });

    test('equality and hashCode', () {
      final rect = const Rect.fromLTWH(0, 0, 100, 100);
      final xFile = FakeXFile('test.png');
      final model1 = ShareParamsModel(
        title: 'Title',
        text: 'Text',
        sharePositionOrigin: rect,
        previewThumbnail: xFile,
      );
      final model2 = ShareParamsModel(
        title: 'Title',
        text: 'Text',
        sharePositionOrigin: rect,
        previewThumbnail: xFile,
      );
      final model3 = ShareParamsModel(
        title: 'Other',
        text: 'Text',
        sharePositionOrigin: rect,
        previewThumbnail: xFile,
      );

      expect(model1, equals(model2));
      expect(model1.hashCode, equals(model2.hashCode));
      expect(model1, isNot(equals(model3)));
      expect(model1.hashCode, isNot(equals(model3.hashCode)));
    });
  });
}

import 'dart:ui';

import 'package:share_plus/share_plus.dart';

class ShareParamsModel {
  final String title;
  final String text;
  final Rect? sharePositionOrigin;
  final XFile? previewThumbnail;

  ShareParamsModel(
      {required this.title, required this.text, this.sharePositionOrigin, this.previewThumbnail});

  ShareParamsModel copyWith(
      {String? title, String? text, Rect? sharePositionOrigin, XFile? previewThumbnail}) {
    return ShareParamsModel(
      title: title ?? this.title,
      text: text ?? this.text,
      sharePositionOrigin: sharePositionOrigin ?? this.sharePositionOrigin,
      previewThumbnail: previewThumbnail ?? this.previewThumbnail,
    );
  }

  ShareParams toShareParams() {
    return ShareParams(
      title: title,
      text: text,
      sharePositionOrigin: sharePositionOrigin,
      previewThumbnail: previewThumbnail,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShareParamsModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          text == other.text &&
          previewThumbnail == other.previewThumbnail &&
          sharePositionOrigin == other.sharePositionOrigin;

  @override
  int get hashCode =>
      title.hashCode ^
      text.hashCode ^
      (sharePositionOrigin?.hashCode ?? 0 ^ previewThumbnail.hashCode);
}

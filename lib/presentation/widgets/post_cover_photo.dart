import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:flutter/material.dart';

class PostCoverPhoto extends StatelessWidget {
  final String imageSrc;
  final Color placeholderColor;
  final double height;

  const PostCoverPhoto({
    this.placeholderColor = Colors.white,
    this.imageSrc = '',
    this.height = AppDimensions.postCoverImageHeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: imageSrc.isEmpty ? placeholderColor : null,
        image: (imageSrc.isNotEmpty)
            ? DecorationImage(
                image: NetworkImage(
                  imageSrc,
                ),
                fit: BoxFit.cover,
              )
            : null,
        borderRadius: BorderRadius.circular(AppDimensions.normalM),
      ),
      height: height,
      padding: const EdgeInsets.all(AppDimensions.minorS),
    );
  }
}

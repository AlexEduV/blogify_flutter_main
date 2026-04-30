import 'dart:io';

import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:flutter/material.dart';

import '../../common/app_colors.dart';

class UserPhoto extends StatelessWidget {
  final String imageSrc;
  final double size;
  final VoidCallback? onSecondaryTap;
  final VoidCallback? onTap;

  const UserPhoto({
    required this.imageSrc,
    this.size = AppDimensions.userPhotoImageHeight,
    this.onSecondaryTap,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final image = getUserImage();
    final photoButtonSize = 40.0;

    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentGeometry.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: AppDimensions.normalM),
          child: Material(
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: onTap,
              customBorder: const CircleBorder(),
              highlightColor: Colors.white.withAlpha(120),
              child: image != null
                  ? Ink.image(
                      image: image,
                      width: size,
                      height: size,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    )
                  : null,
            ),
          ),
        ),
        if (onSecondaryTap != null) ...[
          Positioned(
            bottom: 0,
            right: 0,
            child: Material(
              color: Colors.transparent,
              shape: const CircleBorder(),
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.normalS),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  splashColor: Colors.white.withAlpha(120),
                  onTap: onSecondaryTap,
                  child: Ink(
                    height: photoButtonSize,
                    width: photoButtonSize,
                    decoration: const BoxDecoration(
                      color: AppColors.emeraldGreen,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0, 2),
                          blurRadius: 2.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                    child: const Icon(Icons.edit, color: Colors.white, size: 24),
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  ImageProvider<Object>? getUserImage() {
    if (imageSrc.isEmpty) return null;

    if (imageSrc.startsWith('https://')) {
      return NetworkImage(imageSrc);
    }

    return FileImage(File(imageSrc));
  }
}

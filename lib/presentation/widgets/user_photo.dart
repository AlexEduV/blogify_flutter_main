import 'dart:io';

import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:flutter/material.dart';

import '../../common/app_colors.dart';

class UserPhoto extends StatelessWidget {
  final String imageSrc;
  final double size;
  final VoidCallback? onTap;

  const UserPhoto({
    required this.imageSrc,
    this.size = AppDimensions.userPhotoImageHeight,
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
          padding: const EdgeInsets.only(bottom: AppDimensions.minorL),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white, // Set your desired border color
                width: 3.0, // Set your desired border width
              ),
              image: image != null
                  ? DecorationImage(image: image, fit: BoxFit.cover, alignment: Alignment.topCenter)
                  : null,
            ),
          ),
        ),
        if (onTap != null) ...[
          Positioned(
            bottom: 0,
            right: 0,
            child: Material(
              color: Colors.transparent,
              shape: const CircleBorder(),
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.minorM),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  splashColor: Colors.white.withAlpha(120),
                  onTap: onTap,
                  child: Ink(
                    height: photoButtonSize,
                    width: photoButtonSize,
                    decoration: BoxDecoration(
                      color: AppColors.dark,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.offGrey,
                          offset: const Offset(0, 2),
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
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

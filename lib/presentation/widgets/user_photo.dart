import 'dart:io';

import 'package:blogify_flutter_main/common/app_colors.dart';
import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:flutter/material.dart';

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

    return Stack(
      alignment: AlignmentGeometry.center,
      children: [
        Container(
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
        if (onTap != null) ...[
          //todo: the button does not show the splash effect;
          Positioned(
            bottom: 0,
            right: 0,
            child: Material(
              color: AppColors.accentColor,
              shape: const CircleBorder(),
              child: InkWell(
                customBorder: const CircleBorder(),
                splashColor: AppColors.accentColor.withAlpha(60),
                highlightColor: Colors.transparent,
                onTap: onTap,
                child: const CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 20,
                  child: Icon(Icons.edit, color: Colors.white, size: 20 * 1.2),
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

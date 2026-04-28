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
    return Material(
      color: Colors.transparent,
      shape: const RoundedRectangleBorder(),
      child: InkWell(
        borderRadius: BorderRadius.circular(50.0),
        onTap: onTap,
        child: Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: imageSrc.isNotEmpty
                ? DecorationImage(
                    image: FileImage(File(imageSrc)),
                    fit: BoxFit.cover,
                  )
                : null,
            color: imageSrc.isNotEmpty ? null : AppColors.lightGrey,
          ),
        ),
      ),
    );
  }
}

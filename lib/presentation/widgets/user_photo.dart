import 'package:blogify_flutter_main/common/app_colors.dart';
import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/common/semantics_labels.dart';
import 'package:blogify_flutter_main/presentation/widgets/app_semantics.dart';
import 'package:blogify_flutter_main/utils/image_provider_util.dart';
import 'package:flutter/material.dart';

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
    final image = ImageProviderUtil.getUserImageProvider(imageSrc);
    final outlineBorderWidth = size / 40;

    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentGeometry.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: AppDimensions.normalM),
          child: Container(
            width: size + (outlineBorderWidth * 2),
            height: size + (outlineBorderWidth * 2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.withAlpha(120), width: outlineBorderWidth),
            ),
            child: AppSemantics(
              button: true,
              enabled: onTap != null,
              label: SemanticsLabels.userPhotoButton,
              child: Material(
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: onTap,
                  customBorder: const CircleBorder(),
                  highlightColor: Colors.grey.withAlpha(120),
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
                padding: const EdgeInsets.all(AppDimensions.minorM),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  splashColor: Colors.grey.withAlpha(120),
                  onTap: onSecondaryTap,
                  child: Ink(
                    height: AppDimensions.userPhotoEditButtonSize,
                    width: AppDimensions.userPhotoEditButtonSize,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 2.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.edit,
                      color: AppColors.emeraldGreen,
                      size: AppDimensions.userPhotoEditButtonIconSize,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

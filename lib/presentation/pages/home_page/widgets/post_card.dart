import 'package:blogify_flutter_main/common/app_colors.dart';
import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';

import '../../../../utils/intl_formatter.dart';
import '../../../widgets/post_cover_photo.dart';

class PostCard extends StatelessWidget {
  final PostEntity post;
  final Function(int) onTap;

  const PostCard({
    required this.post,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: InkWell(
        onTap: () => onTap(post.id),
        borderRadius: BorderRadius.circular(AppDimensions.normalL),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(AppDimensions.normalL),
            border: Border.all(
              width: AppDimensions.minorS,
              color: Colors.white,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.17),
                blurRadius: 30,
                spreadRadius: 1,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          padding: const EdgeInsets.all(AppDimensions.minorS),
          child: Column(
            children: [
              PostCoverPhoto(
                imageSrc: post.imageSrc,
              ),
              const SizedBox(height: AppDimensions.normalM),
              Text(
                post.author,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0,
                ),
              ),
              Text(
                IntlFormatter.getFormattedDays(post.daysAgoPublished),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.0,
                  color: AppColors.accentColor,
                ),
              ),
              const SizedBox(height: AppDimensions.majorS),
              Text(
                post.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimensions.majorS),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Read Time: ',
                    style: TextStyle(
                      color: AppColors.accentColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${post.minToRead} min',
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.normalS),
            ],
          ),
        ),
      ),
    );
  }
}

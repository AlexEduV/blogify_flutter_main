import 'package:blogify_flutter_main/common/app_colors.dart';
import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/common/app_text_styles.dart';
import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:blogify_flutter_main/l10n/l10n.dart';
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
                style: AppTextStyles.sfPro16,
              ),
              Text(
                IntlFormatter.getFormattedDays(post.daysAgoPublished),
                style: AppTextStyles.sfPro14Accent,
              ),
              const SizedBox(height: AppDimensions.majorS),
              Text(
                post.title,
                style: AppTextStyles.sfPro24,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimensions.majorS),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${L10n.articleReadTimeLabel} ',
                    style: AppTextStyles.sfPro14Accent.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '${post.minToRead} ${L10n.articleReadTimeUnits}',
                    style: AppTextStyles.sfPro14.copyWith(fontWeight: FontWeight.w600),
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

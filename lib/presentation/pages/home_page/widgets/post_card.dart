import 'package:blogify_flutter_main/core/utils/intl_formatter.dart';
import 'package:blogify_flutter_main/domain/entities/post_entity.dart';
import 'package:blogify_flutter_main/presentation/common/widgets/post_cover_photo.dart';
import 'package:blogify_flutter_main/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';

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

    return InkWell(
      onTap: () => onTap(post.id),
      borderRadius: BorderRadius.circular(24),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(width: 4.0, color: Colors.white,),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.17),
              blurRadius: 30,
              spreadRadius: 1,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [

            PostCoverPhoto(
              imageSrc: post.imageSrc,
            ),

            const SizedBox(height: 16.0,),

            Text(
              post.author,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15.0,
              ),
            ),

            Text(
              IntlFormatter.getFormattedDays(post.daysAgoPublished),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
                color: AppColors.accentColor,
              ),
            ),

            const SizedBox(height: 24.0,),

            Text(
              post.title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24.0,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24.0,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Read Time: ',
                  style: TextStyle(
                    color: AppColors.accentColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                Text(
                  '${post.minToRead} min',
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12.0,),

          ],
        ),
      ),
    );
  }
}

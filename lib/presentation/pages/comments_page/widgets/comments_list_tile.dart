import 'package:blogify_flutter_main/common/app_colors.dart';
import 'package:blogify_flutter_main/common/app_dimensions.dart';
import 'package:blogify_flutter_main/domain/entities/comment_entity.dart';
import 'package:blogify_flutter_main/domain/entities/user_entity.dart';
import 'package:blogify_flutter_main/domain/helpers/relative_date_helper.dart';
import 'package:flutter/material.dart';

import '../../../widgets/user_photo.dart';

class CommentsListTile extends StatelessWidget {
  final UserEntity user;
  final CommentEntity comment;

  const CommentsListTile({
    required this.user,
    required this.comment,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppDimensions.normalS,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserPhoto(
          imageSrc: user.imageSrc,
          size: AppDimensions.commentsUserAvatarImageSize,
        ),
        Expanded(
          child: Column(
            spacing: AppDimensions.minorS,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: AppDimensions.minorL,
                children: [
                  Text(
                    '${user.firstName} ${user.lastName}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    RelativeDateHelper.getRelativeDate(comment.date),
                    style: TextStyle(
                      color: AppColors.darkGrey,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
              Text(
                comment.content,
                softWrap: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

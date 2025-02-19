import 'package:blogify_flutter_main/domain/entities/comment_entity.dart';
import 'package:blogify_flutter_main/domain/entities/user_entity.dart';
import 'package:blogify_flutter_main/domain/helpers/relative_date_helper.dart';
import 'package:blogify_flutter_main/presentation/common/widgets/user_photo.dart';
import 'package:flutter/material.dart';

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
      spacing: 12.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        UserPhoto(
          imageSrc: user.imageSrc,
          size: 40,
        ),

        Expanded(
          child: Column(
            spacing: 4.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                spacing: 8.0,
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
                      color: Colors.grey[600],
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

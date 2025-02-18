import 'package:blogify_flutter_main/domain/entities/user_entity.dart';

class CommentEntity {

  final int postId;
  final String content;
  final String date;
  final int userId;

  const CommentEntity({
    required this.postId,
    required this.content,
    required this.date,
    required this.userId,
  });

}

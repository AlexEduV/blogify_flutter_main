import 'package:blogify_flutter_main/domain/entities/category.dart';

class PostEntity {

  final int id;
  final String title;

  final Category? category;

  final String author;
  final String imageSrc;
  final int daysAgoPublished;
  final int minToRead;

  final bool isLiked;

  final String content;

  const PostEntity({
    required this.id,
    required this.title,
    required this.author,
    required this.daysAgoPublished,
    required this.minToRead,
    this.category = Category.none,
    this.isLiked = false,
    this.imageSrc = '',
    this.content = '',
  });

  PostEntity copyWith({
    int? id,
    String? title,
    Category? category,
    String? author,
    String? imageSrc,
    int? daysAgoPublished,
    bool? isLiked,
    int? minToRead,
    String? content,
  }) {
    return PostEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      author: author ?? this.author,
      daysAgoPublished: daysAgoPublished ?? this.daysAgoPublished,
      minToRead: minToRead ?? this.minToRead,
      isLiked: isLiked ?? this.isLiked,
      content: content ?? this.content,
      imageSrc: imageSrc ?? this.imageSrc,
    );
  }

}

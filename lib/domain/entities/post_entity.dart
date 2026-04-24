import 'package:blogify_flutter_main/domain/helpers/category_helper.dart';

class PostEntity {
  final int id;
  final String title;

  final Category? category;

  final String author;
  final String imageSrc;
  final int daysAgoPublished;
  final int minToRead;

  final bool isLiked;

  final List<String> paragraphs;

  const PostEntity({
    required this.id,
    required this.title,
    required this.author,
    required this.daysAgoPublished,
    required this.minToRead,
    this.category = Category.none,
    this.isLiked = false,
    this.imageSrc = '',
    this.paragraphs = const [],
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
    List<String>? paragraphs,
  }) {
    return PostEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      author: author ?? this.author,
      daysAgoPublished: daysAgoPublished ?? this.daysAgoPublished,
      minToRead: minToRead ?? this.minToRead,
      isLiked: isLiked ?? this.isLiked,
      imageSrc: imageSrc ?? this.imageSrc,
      paragraphs: paragraphs ?? this.paragraphs,
    );
  }
}

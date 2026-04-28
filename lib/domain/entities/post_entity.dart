import '../../common/enums/post_category.dart';

class PostEntity {
  final int id;
  final String title;

  final PostCategory? category;

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
    this.category = PostCategory.none,
    this.isLiked = false,
    this.imageSrc = '',
    this.paragraphs = const [],
  });

  PostEntity copyWith({
    int? id,
    String? title,
    PostCategory? category,
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

  factory PostEntity.empty() {
    return const PostEntity(
        id: 0,
        title: 'Sample article',
        author: 'Unknown author',
        daysAgoPublished: 7,
        minToRead: 15);
  }

  static PostEntity fromJson(Map<String, dynamic> json) {
    return PostEntity(
      id: json['id'] as int,
      title: json['title'] as String,
      author: json['author'] as String,
      daysAgoPublished: json['daysAgoPublished'] as int,
      minToRead: json['minToRead'] as int,
      category: PostCategory.fromLabel(json['category'] as String),
      isLiked: (json['isLiked'] ?? false) as bool,
      imageSrc: json['imageSrc'] as String,
      paragraphs: json['paragraphs'] as List<String>,
    );
  }
}

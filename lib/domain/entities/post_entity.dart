class PostEntity {

  final int id;
  final String title;
  final String author;
  final String imageSrc;
  final int daysAgoPublished;
  final int minToRead;

  final bool isDismissed;

  final String content;

  const PostEntity({
    required this.id,
    required this.title,
    required this.author,
    required this.daysAgoPublished,
    required this.minToRead,
    this.imageSrc = '',
    this.isDismissed = false,
    this.content = '',
  });

  PostEntity copyWith({
    int? id,
    String? title,
    String? author,
    String? imageSrc,
    int? daysAgoPublished,
    int? minToRead,
    bool? isDismissed,
    String? content,
  }) {
    return PostEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      daysAgoPublished: daysAgoPublished ?? this.daysAgoPublished,
      minToRead: minToRead ?? this.minToRead,
      isDismissed: isDismissed ?? this.isDismissed,
      content: content ?? this.content,
      imageSrc: imageSrc ?? this.imageSrc,
    );
  }


}

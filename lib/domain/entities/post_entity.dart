class PostEntity {

  final String title;
  final String author;
  final String imageSrc;
  final int daysAgoPublished;
  final int minToRead;

  final String content;

  const PostEntity({
    required this.title,
    required this.author,
    required this.daysAgoPublished,
    required this.minToRead,
    this.imageSrc = '',
    this.content = '',
  });

}

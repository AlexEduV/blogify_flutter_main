enum PostCategory {
  design(1),
  tech(2),
  trending(0),
  none(null);

  final int? tabIndex;

  const PostCategory(this.tabIndex);
}

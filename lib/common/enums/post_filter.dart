import 'package:blogify_flutter_main/l10n/l10n.dart';

enum PostFilter {
  title(L10n.searchFilterTitle),
  author(L10n.searchFilterAuthor);

  const PostFilter(this.label);

  final String label;
}

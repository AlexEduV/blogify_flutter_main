import 'package:blogify_flutter_main/l10n/l10n.dart';

enum PostCategory {
  design(tabIndex: 1, label: L10n.postsCategoryDesign),
  tech(tabIndex: 2, label: L10n.postsCategoryTech),
  trending(tabIndex: 0, label: L10n.postsCategoryTrending),
  none();

  final int? tabIndex;
  final String label;

  const PostCategory({this.tabIndex, this.label = ''});

  static PostCategory? fromLabel(String label) {
    return PostCategory.values.where((element) => element.name == label).firstOrNull;
  }
}

import 'package:blogify_flutter_main/l10n/l10n.dart';

import '../app_constants.dart';

enum PostCategory {
  design(tabIndex: AppConstants.homeTabDesignIndex, label: L10n.postsCategoryDesign),
  tech(tabIndex: AppConstants.homeTabTechIndex, label: L10n.postsCategoryTech),
  trending(tabIndex: AppConstants.homeTabTrendingIndex, label: L10n.postsCategoryTrending),
  none();

  final int? tabIndex;
  final String label;

  const PostCategory({this.tabIndex, this.label = ''});

  static PostCategory? fromLabel(String label) {
    return PostCategory.values.where((element) => element.name == label).firstOrNull;
  }
}

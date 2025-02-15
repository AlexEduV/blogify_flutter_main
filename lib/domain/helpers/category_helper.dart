class CategoryHelper {

  static Category getCategoryByIndex(int index) {

    switch (index) {
      case 0:
        return Category.trending;
      case 1:
        return Category.design;
      case 2:
        return Category.tech;

      default:
        return Category.none;
    }
  }

}

enum Category {
  design, tech, trending, none,
}

extension AddIfNotContains<T> on List<T> {
  void addIfNotContains(T value) {
    if (contains(value)) {
      return;
    }

    add(value);
  }
}

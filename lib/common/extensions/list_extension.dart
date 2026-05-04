extension AddIfNotContains<T> on List<T> {
  void addIfNotContains(T value) {
    if (contains(value)) {
      return;
    }

    add(value);
  }
}

extension AddOrRemoveIfContains<T> on List<T> {
  void addOrRemoveIfContains(T value) {
    if (contains(value)) {
      remove(value);
      return;
    }

    add(value);
  }
}

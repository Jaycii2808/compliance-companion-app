extension StringEx on String? {
  bool isNotNullOrEmpty() {
    return this != null && this!.isNotEmpty;
  }
}
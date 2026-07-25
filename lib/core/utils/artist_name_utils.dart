List<String> splitArtistNames(String artistNames) {
  final separator = RegExp(
    r'\s*(?:[,;/&+]|\s(?:and|feat(?:uring)?\.?|ft\.?|x)\s)\s*',
    caseSensitive: false,
  );

  return artistNames
      .split(separator)
      .map((name) => name.trim())
      .where((name) => name.isNotEmpty)
      .toList();
}

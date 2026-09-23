final _artistSeparator = RegExp(
  r'\s*(?:[&;,]|//|\s+(?:ft\.|featuring|feat\.?|x)\s+)\s*',
  caseSensitive: false,
);

List<String> splitArtistNames(String artistNames) => artistNames
    .split(_artistSeparator)
    .map((name) => name.trim())
    .where((name) => name.isNotEmpty)
    .toSet()
    .toList();

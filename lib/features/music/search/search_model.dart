enum SearchResultType {
  artist,
  album,
  track,
  defaultSearch,
}

class SearchResultsModel<T> {
  final SearchResultType searchResultType;
  final T result;
  final int count;

  SearchResultsModel({
    required this.searchResultType,
    required this.result,
    this.count = 0,
  });
}

class MetadataWorker {
  static Future<MetadataWorker> start() =>
      throw UnsupportedError('Local metadata indexing requires a filesystem');

  Future<Map<String, dynamic>> read(String uri, {String? artworkDirectory}) =>
      throw UnsupportedError('Local metadata indexing requires a filesystem');

  Future<void> close() async {}
}

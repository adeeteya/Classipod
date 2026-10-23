/// Returns true when the directory is either toggled off manually or its
/// path contains one of the saved folder filters (case-insensitive), which
/// hides that folder and every subfolder under it.
bool isDirectoryExcluded({
  required String? directoryPath,
  required Set<String> excludedDirectoryPaths,
  required List<String> nameFilters,
}) {
  if (directoryPath == null) {
    return false;
  }
  if (excludedDirectoryPaths.contains(directoryPath)) {
    return true;
  }
  final String path = directoryPath.toLowerCase();
  return nameFilters.any((filter) => path.contains(filter.toLowerCase()));
}

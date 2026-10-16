/// Normalizes a playlist name typed by the user.
///
/// The click-wheel alphabet only types lowercase, so capitalize the first
/// letter to match the naming style of the rest of the app. Surrounding
/// whitespace is dropped and the result is empty when nothing was typed.
String capitalizeFirstLetter(String value) {
  final trimmed = value.trim();
  if (trimmed.isEmpty) return '';
  return trimmed[0].toUpperCase() + trimmed.substring(1);
}

final _leadingLetter = RegExp(r'^\p{L}', unicode: true);
final _leadingNumber = RegExp(r'^\p{N}', unicode: true);

int compareNames(String a, String b) {
  final aName = a.trim().toLowerCase();
  final bName = b.trim().toLowerCase();
  final groupComparison = _nameGroup(aName).compareTo(_nameGroup(bName));
  if (groupComparison != 0) return groupComparison;

  return aName.compareTo(bName);
}

int _nameGroup(String name) {
  if (_leadingLetter.hasMatch(name)) return 0;
  if (_leadingNumber.hasMatch(name)) return 1;
  return 2;
}

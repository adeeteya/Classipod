import 'package:classipod/core/models/library_context.dart';
import 'package:flutter_riverpod/legacy.dart';

final libraryContextProvider = StateProvider<LibraryContext>(
  (ref) => LibraryContext.music,
);

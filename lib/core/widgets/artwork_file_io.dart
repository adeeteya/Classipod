import 'dart:io';

import 'package:flutter/widgets.dart';

ImageProvider fileArtwork(String path) => FileImage(File(path));

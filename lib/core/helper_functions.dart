bool isSupportedAudioFormat(String path) {
  if (path.endsWith('.mp3') ||
      path.endsWith('.ogg') ||
      path.endsWith('.wav') ||
      path.endsWith('.flac') ||
      path.endsWith('.m4a') ||
      path.endsWith('.aac')) {
    return true;
  } else {
    return false;
  }
}

const Set<String> supportedAudioFileExtensions = {
  '.aac',
  '.aif',
  '.aifc',
  '.aiff',
  '.ape',
  '.flac',
  '.m4a',
  '.mov',
  '.mp3',
  '.mp4',
  '.ogg',
  '.opus',
  '.wav',
};

bool isSupportedAudioFormat(String path) {
  final String lowercasePath = path.toLowerCase();
  return supportedAudioFileExtensions.any(lowercasePath.endsWith);
}

import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/features/now_playing/provider/now_playing_details_provider.dart';
import 'package:classipod/features/status_bar/widgets/status_bar.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SongEditScreen extends ConsumerStatefulWidget {
  final MusicMetadata songMetadata;

  const SongEditScreen({super.key, required this.songMetadata});

  @override
  ConsumerState<SongEditScreen> createState() => _SongEditScreenState();
}

class _SongEditScreenState extends ConsumerState<SongEditScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _artistController;
  late final TextEditingController _albumController;
  late final TextEditingController _genreController;
  late final TextEditingController _lyricsController;

  late final String _initialTitle;
  late final String _initialArtists;
  late final String _initialAlbum;
  late final String _initialGenre;
  late final String _initialLyrics;

  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    final metadata = widget.songMetadata;
    _initialTitle = metadata.trackName ?? '';
    _initialArtists = (metadata.trackArtistNames ?? []).join(', ');
    _initialAlbum = metadata.albumName ?? '';
    _initialGenre = metadata.genres.join(', ');
    _initialLyrics = metadata.lyrics ?? '';

    _titleController = TextEditingController(text: _initialTitle);
    _artistController = TextEditingController(text: _initialArtists);
    _albumController = TextEditingController(text: _initialAlbum);
    _genreController = TextEditingController(text: _initialGenre);
    _lyricsController = TextEditingController(text: _initialLyrics);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _artistController.dispose();
    _albumController.dispose();
    _genreController.dispose();
    _lyricsController.dispose();
    super.dispose();
  }

  Future<void> _saveChanges() async {
    if (_isSaving) {
      return;
    }
    setState(() {
      _isSaving = true;
    });

    final String titleInput = _titleController.text.trim();
    final String albumInput = _albumController.text.trim();
    final String genreInput = _genreController.text.trim();
    final String lyricsInput = _lyricsController.text.trim();
    final String artistInput = _artistController.text.trim();

    final bool titleChanged = titleInput != _initialTitle.trim();
    final bool albumChanged = albumInput != _initialAlbum.trim();
    final bool genreChanged = genreInput != _initialGenre.trim();
    final bool lyricsChanged = lyricsInput != _initialLyrics.trim();
    final bool artistChanged = artistInput != _initialArtists.trim();

    final updatedMetadata = widget.songMetadata.copyWith(
      trackName: titleChanged ? titleInput : null,
      albumName: albumChanged ? albumInput : null,
      genres: genreChanged ? _splitInput(genreInput) : null,
      lyrics: lyricsChanged ? lyricsInput : null,
      trackArtistNames: artistChanged ? _splitInput(artistInput) : null,
    );

    await ref
        .read(nowPlayingDetailsProvider.notifier)
        .updateMetadata(updatedMetadata);

    if (mounted) {
      Navigator.of(context).pop(updatedMetadata);
    }
  }

  List<String> _splitInput(String value) {
    if (value.isEmpty) {
      return [];
    }
    return value
        .split(',')
        .map((entry) => entry.trim())
        .where((entry) => entry.isNotEmpty)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        child: Column(
          children: [
            StatusBar(title: context.localization.editSongScreenTitle),
            Expanded(
              child: CupertinoScrollbar(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    _SongEditField(
                      label: context.localization.editSongNameLabel,
                      controller: _titleController,
                    ),
                    _SongEditField(
                      label: context.localization.editSongArtistLabel,
                      controller: _artistController,
                    ),
                    _SongEditField(
                      label: context.localization.editSongAlbumLabel,
                      controller: _albumController,
                    ),
                    _SongEditField(
                      label: context.localization.editSongGenreLabel,
                      controller: _genreController,
                    ),
                    _SongEditField(
                      label: context.localization.editSongLyricsLabel,
                      controller: _lyricsController,
                      maxLines: 5,
                    ),
                    const SizedBox(height: 24),
                    CupertinoButton.filled(
                      onPressed: _isSaving ? null : _saveChanges,
                      child: _isSaving
                          ? const CupertinoActivityIndicator()
                          : Text(context.localization.saveChangesButton),
                    ),
                    const SizedBox(height: 12),
                    CupertinoButton(
                      onPressed: _isSaving
                          ? null
                          : () => Navigator.of(context).pop(),
                      child: Text(context.localization.cancelText),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SongEditField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final int maxLines;

  const _SongEditField({
    required this.label,
    required this.controller,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: CupertinoTheme.of(context).textTheme.textStyle
                .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          CupertinoTextField(
            controller: controller,
            maxLines: maxLines,
            minLines: maxLines,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            style: CupertinoTheme.of(context).textTheme.textStyle
                .copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

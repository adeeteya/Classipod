import 'package:classipod/core/models/music_metadata.dart';
import 'package:classipod/features/music/playlist/models/playlist_model.dart';
import 'package:hive_ce/hive.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([AdapterSpec<MusicMetadata>(), AdapterSpec<PlaylistModel>()])
class HiveAdapters {}

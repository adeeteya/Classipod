import 'package:classipod/core/models/metadata.dart';
import 'package:classipod/features/music/playlist/models/playlist_model.dart';
import 'package:hive_ce/hive.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([AdapterSpec<Metadata>(), AdapterSpec<PlaylistModel>()])
class HiveAdapters {}

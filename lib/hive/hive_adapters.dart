import 'package:classipod/core/models/metadata.dart';
import 'package:hive_ce/hive.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([AdapterSpec<Metadata>()])
class HiveAdapters {}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class PlaylistModelAdapter extends TypeAdapter<PlaylistModel> {
  @override
  final typeId = 1;

  @override
  PlaylistModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlaylistModel(
      name: fields[1] as String,
      songs: (fields[2] as List).cast<MusicMetadata>(),
    );
  }

  @override
  void write(BinaryWriter writer, PlaylistModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.songs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaylistModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MusicMetadataAdapter extends TypeAdapter<MusicMetadata> {
  @override
  final typeId = 2;

  @override
  MusicMetadata read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MusicMetadata(
      trackName: fields[0] as String?,
      trackArtistNames: (fields[1] as List?)?.cast<String>(),
      albumName: fields[2] as String?,
      albumArtistName: fields[3] as String?,
      trackNumber: (fields[4] as num?)?.toInt(),
      albumLength: (fields[5] as num?)?.toInt(),
      year: (fields[6] as num?)?.toInt(),
      genres: fields[7] == null ? const [] : (fields[7] as List).cast<String>(),
      discNumber: (fields[8] as num?)?.toInt(),
      mimeType: fields[9] as String?,
      trackDuration: (fields[10] as num?)?.toInt(),
      bitrate: (fields[11] as num?)?.toInt(),
      filePath: fields[12] as String?,
      thumbnailPath: fields[13] as String?,
      originalSongIndex: fields[14] == null ? 0 : (fields[14] as num).toInt(),
      isOnDevice: fields[15] == null ? true : fields[15] as bool,
      rating: fields[16] == null ? 0 : (fields[16] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, MusicMetadata obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.trackName)
      ..writeByte(1)
      ..write(obj.trackArtistNames)
      ..writeByte(2)
      ..write(obj.albumName)
      ..writeByte(3)
      ..write(obj.albumArtistName)
      ..writeByte(4)
      ..write(obj.trackNumber)
      ..writeByte(5)
      ..write(obj.albumLength)
      ..writeByte(6)
      ..write(obj.year)
      ..writeByte(7)
      ..write(obj.genres)
      ..writeByte(8)
      ..write(obj.discNumber)
      ..writeByte(9)
      ..write(obj.mimeType)
      ..writeByte(10)
      ..write(obj.trackDuration)
      ..writeByte(11)
      ..write(obj.bitrate)
      ..writeByte(12)
      ..write(obj.filePath)
      ..writeByte(13)
      ..write(obj.thumbnailPath)
      ..writeByte(14)
      ..write(obj.originalSongIndex)
      ..writeByte(15)
      ..write(obj.isOnDevice)
      ..writeByte(16)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MusicMetadataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ExcludeDirectoryModelAdapter extends TypeAdapter<ExcludeDirectoryModel> {
  @override
  final typeId = 3;

  @override
  ExcludeDirectoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExcludeDirectoryModel(
      directoryPath: fields[0] as String,
      isExcluded: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ExcludeDirectoryModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.directoryPath)
      ..writeByte(1)
      ..write(obj.isExcluded);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExcludeDirectoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

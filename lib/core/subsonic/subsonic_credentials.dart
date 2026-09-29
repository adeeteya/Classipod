import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SubsonicCredentialStore {
  Future<String?> read(String id);
  Future<void> write(String id, String password);
  Future<void> delete(String id);
}

class PlatformSubsonicCredentialStore implements SubsonicCredentialStore {
  final FlutterSecureStorage storage;
  final Map<String, String> _session = {};
  PlatformSubsonicCredentialStore({
    this.storage = const FlutterSecureStorage(),
  });

  @override
  Future<String?> read(String id) async =>
      kIsWeb ? _session[id] : await storage.read(key: 'subsonic:$id');

  @override
  Future<void> write(String id, String password) async {
    if (kIsWeb) {
      _session[id] = password;
    } else {
      await storage.write(key: 'subsonic:$id', value: password);
    }
  }

  @override
  Future<void> delete(String id) async {
    _session.remove(id);
    if (!kIsWeb) await storage.delete(key: 'subsonic:$id');
  }
}

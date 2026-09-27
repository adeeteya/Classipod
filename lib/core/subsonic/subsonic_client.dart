import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class SubsonicException implements Exception {
  final String code;
  const SubsonicException(this.code);
  @override
  String toString() => 'Subsonic: $code';
}

class SubsonicConfig {
  final String url;
  final String username;
  final bool enabled;
  const SubsonicConfig(this.url, this.username, {this.enabled = false});

  String get id => sha256.convert(utf8.encode('$url\n$username')).toString();

  SubsonicConfig withEnabled(bool value) =>
      SubsonicConfig(url, username, enabled: value);

  static String normalizeUrl(String value) {
    final uri = Uri.tryParse(value.trim());
    if (uri == null ||
        !['http', 'https'].contains(uri.scheme) ||
        uri.host.isEmpty ||
        uri.userInfo.isNotEmpty ||
        uri.hasQuery ||
        uri.hasFragment) {
      throw const SubsonicException('url');
    }
    return uri
        .replace(path: uri.path.replaceFirst(RegExp(r'/+$'), ''))
        .toString();
  }
}

class SubsonicClient {
  final SubsonicConfig config;
  final String _password;
  final http.Client _http;
  final String Function() _salt;
  bool _closed = false;

  SubsonicClient(
    this.config,
    String password, {
    http.Client? client,
    String Function()? salt,
  }) : _password = password,
       _http = client ?? http.Client(),
       _salt = salt ?? _randomSalt;

  static String _randomSalt() {
    final random = Random.secure();
    return List.generate(
      16,
      (_) => random.nextInt(256).toRadixString(16).padLeft(2, '0'),
    ).join();
  }

  Uri uri(String endpoint, [Map<String, String> parameters = const {}]) {
    if (_closed) throw const SubsonicException('cancelled');
    final salt = _salt();
    return Uri.parse('${config.url}/rest/$endpoint.view').replace(
      queryParameters: {
        'u': config.username,
        't': md5.convert(utf8.encode('$_password$salt')).toString(),
        's': salt,
        'v': '1.13.0',
        'c': 'ClassiPod',
        'f': 'json',
        ...parameters,
      },
    );
  }

  Future<http.Response> _get(
    String endpoint,
    Map<String, String> params,
  ) async {
    try {
      final response = await _http
          .get(uri(endpoint, params))
          .timeout(const Duration(seconds: 20));
      if (_closed) throw const SubsonicException('cancelled');
      if (response.statusCode == 401 || response.statusCode == 403) {
        throw const SubsonicException('credentials');
      }
      if (response.statusCode != 200) {
        throw const SubsonicException('http');
      }
      return response;
    } on SubsonicException {
      rethrow;
    } on TimeoutException {
      throw const SubsonicException('timeout');
    } catch (_) {
      throw SubsonicException(_closed ? 'cancelled' : 'connection');
    }
  }

  Future<Map<String, dynamic>> request(
    String endpoint, [
    Map<String, String> params = const {},
  ]) async {
    final response = await _get(endpoint, params);
    try {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      final envelope = data['subsonic-response'];
      if (envelope is! Map<String, dynamic>) {
        throw const SubsonicException('response');
      }
      if (envelope['status'] != 'ok') {
        final code = envelope['error']?['code'].toString();
        throw SubsonicException(switch (code) {
          '40' || '50' => 'credentials',
          '20' || '30' || '41' => 'unsupported',
          _ => 'server',
        });
      }
      return envelope;
    } on SubsonicException {
      rethrow;
    } catch (_) {
      throw const SubsonicException('response');
    }
  }

  Future<void> ping() async {
    await request('ping');
  }

  Future<Uint8List> artwork(String id) async {
    final response = await _get('getCoverArt', {'id': id, 'size': '600'});
    if (!(response.headers['content-type'] ?? '').startsWith('image/') ||
        response.bodyBytes.isEmpty) {
      throw const SubsonicException('artwork');
    }
    return response.bodyBytes;
  }

  void close() {
    _closed = true;
    _http.close();
  }
}

import 'package:classipod/core/extensions/build_context_extensions.dart';
import 'package:classipod/core/subsonic/subsonic_client.dart';
import 'package:classipod/core/subsonic/subsonic_controller.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String subsonicError(BuildContext context, String code) {
  final l = context.localization;
  return switch (code) {
    'url' => l.subsonicInvalidUrl,
    'credentials' => l.subsonicCredentialsError,
    'unsupported' => l.subsonicUnsupported,
    'storage' => l.subsonicStorageError,
    'signin' => l.subsonicSignIn,
    'timeout' => l.subsonicTimeout,
    'connection' || 'http' => l.subsonicConnectionError,
    _ => l.subsonicServerError,
  };
}

Future<void> showSubsonicDialog(BuildContext context) =>
    showCupertinoDialog<void>(
      context: context,
      builder: (_) => const SubsonicDialog(),
    );

class SubsonicDialog extends ConsumerStatefulWidget {
  const SubsonicDialog({super.key});
  @override
  ConsumerState<SubsonicDialog> createState() => _SubsonicDialogState();
}

class _SubsonicDialogState extends ConsumerState<SubsonicDialog> {
  late final TextEditingController _url;
  late final TextEditingController _username;
  final _password = TextEditingController();
  bool _obscured = true;
  bool _busy = false;
  bool _indexing = false;
  bool _closed = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    final config = ref.read(subsonicControllerProvider).value?.config;
    _url = TextEditingController(text: config?.url);
    _username = TextEditingController(text: config?.username);
  }

  @override
  void dispose() {
    _url.dispose();
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  void _close() {
    if (_closed || !mounted) return;
    _closed = true;
    Navigator.of(context).pop();
  }

  Future<void> _run(Future<void> Function() action) async {
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await action();
      if (!mounted || _closed) return;
      final error = ref.read(subsonicControllerProvider).value?.error;
      if (_indexing && error != null) {
        setState(() {
          _busy = false;
          _error = error;
        });
      } else {
        _close();
      }
    } catch (error) {
      if (mounted && !_closed) {
        setState(() {
          _busy = false;
          _error = error is SubsonicException ? error.code : 'storage';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.localization;
    if (_indexing) {
      return PopScope(
        canPop: false,
        child: CupertinoAlertDialog(
          title: Text(l.subsonicTitle),
          content: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_busy) ...[
                  const CupertinoActivityIndicator(),
                  const SizedBox(height: 12),
                  Text(l.subsonicLoadingLibrary),
                ] else
                  Text(subsonicError(context, _error!)),
              ],
            ),
          ),
          actions: [
            if (!_busy)
              CupertinoDialogAction(
                onPressed: () => _run(
                  () => ref.read(subsonicControllerProvider.notifier).refresh(),
                ),
                child: Text(l.libraryRetry),
              ),
            CupertinoDialogAction(
              onPressed: _close,
              child: Text(
                _busy ? l.subsonicContinueBackground : l.subsonicClose,
              ),
            ),
          ],
        ),
      );
    }
    return PopScope(
      canPop: !_busy,
      child: CupertinoAlertDialog(
        title: Text(l.subsonicConfigure),
        content: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 44),
                child: CupertinoTextField(
                  controller: _url,
                  enabled: !_busy,
                  placeholder: l.subsonicUrl,
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.next,
                  autocorrect: false,
                  key: const Key('subsonic-url'),
                ),
              ),
              const SizedBox(height: 8),
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 44),
                child: CupertinoTextField(
                  controller: _username,
                  enabled: !_busy,
                  placeholder: l.subsonicUsername,
                  textInputAction: TextInputAction.next,
                  autocorrect: false,
                  key: const Key('subsonic-username'),
                ),
              ),
              const SizedBox(height: 8),
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 44),
                child: CupertinoTextField(
                  controller: _password,
                  enabled: !_busy,
                  placeholder: l.subsonicPassword,
                  obscureText: _obscured,
                  autocorrect: false,
                  enableSuggestions: false,
                  key: const Key('subsonic-password'),
                  suffix: CupertinoButton(
                    padding: const EdgeInsets.all(8),
                    onPressed: _busy
                        ? null
                        : () => setState(() => _obscured = !_obscured),
                    child: Icon(
                      _obscured ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                    ),
                  ),
                ),
              ),
              if (_busy)
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: CupertinoActivityIndicator(),
                ),
              if (_error != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    subsonicError(context, _error!),
                    style: const TextStyle(color: CupertinoColors.systemRed),
                  ),
                ),
            ],
          ),
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: _busy ? null : () => Navigator.of(context).pop(),
            child: Text(l.cancelText),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: _busy
                ? null
                : () => _run(
                    () => ref
                        .read(subsonicControllerProvider.notifier)
                        .connect(
                          _url.text,
                          _username.text,
                          _password.text,
                          onConnected: () {
                            if (!mounted || _closed) return;
                            FocusScope.of(context).unfocus();
                            setState(() => _indexing = true);
                          },
                        ),
                  ),
            child: Text(l.subsonicConnect),
          ),
          if (ref.watch(subsonicControllerProvider).value?.config != null)
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: _busy
                  ? null
                  : () => _run(
                      () => ref
                          .read(subsonicControllerProvider.notifier)
                          .remove(),
                    ),
              child: Text(l.subsonicRemove),
            ),
        ],
      ),
    );
  }
}

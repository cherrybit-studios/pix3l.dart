import 'dart:js_interop';

import 'package:pix3l/src/js/pix3l_js.dart';
import 'package:pix3l/src/models/player.dart';

export 'package:pix3l/src/models/player.dart';

/// {@template pix3l}
/// A Dart wrapper for the PIX3L JavaScript SDK by Player3.
///
/// The PIX3L SDK is injected into the Player 3 runtime automatically.
/// No initialization is required — use the static methods directly.
///
/// ```dart
/// final player = await Pix3l.getPlayer();
/// await Pix3l.save({'level': 3, 'score': 7200});
/// final save = await Pix3l.load();
/// ```
/// {@endtemplate}
class Pix3l {
  Pix3l._();

  static final JSPix3l _sdk = PIX3L;

  /// Returns information about the currently authenticated player.
  static Future<Pix3lPlayer> getPlayer() async {
    final jsPlayer = await _sdk.getPlayer().toDart;
    return Pix3lPlayer(
      id: jsPlayer.id.toDart,
      username: jsPlayer.username?.toDart,
      avatarUrl: jsPlayer.avatar_url?.toDart,
    );
  }

  /// Loads previously saved game state for the current player and game.
  ///
  /// [slotKey] is the named save slot (defaults to `"default"`).
  /// Returns the saved state object, or `null` if no save exists.
  static Future<dynamic> load({String? slotKey}) async {
    final result = await _sdk.load(slotKey?.toJS).toDart;
    if (result == null) return null;
    return result.dartify();
  }

  /// Persists [state] to the cloud for the current player and game.
  ///
  /// [state] must be a JSON-serializable object.
  /// [slotKey] specifies the save slot (defaults to `"default"`).
  /// [schemaVersion] is an optional version tag for migration.
  static Future<void> save(
    Map<String, dynamic> state, {
    String? slotKey,
    String? schemaVersion,
  }) async {
    final jsState = state.jsify();
    if (jsState == null) {
      throw ArgumentError('State must be a JSON-serializable object.');
    }

    JSPix3lSaveOptions? options;
    if (slotKey != null || schemaVersion != null) {
      options = JSPix3lSaveOptions(
        slotKey: slotKey?.toJS,
        schemaVersion: schemaVersion?.toJS,
      );
    }

    await _sdk.save(jsState, options).toDart;
  }
}

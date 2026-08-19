import 'dart:js_interop';

import 'package:pix3l/src/js/pix3l_input_js.dart';
import 'package:pix3l/src/js/pix3l_leaderboards_js.dart';

/// The global PIX3L object exposed by the Player 3 runtime.
@JS('PIX3L')
extension type JSPix3l._(JSObject _) implements JSObject {
  /// Returns information about the currently authenticated player.
  external JSPromise<JSPix3lPlayer> getPlayer();

  /// Loads previously saved game state for the current player and game.
  /// [slotKey] is the named save slot (default: "default").
  /// Returns the saved state object, or `null` if no save exists.
  external JSPromise<JSAny?> load([JSString? slotKey]);

  /// Persists game state to the cloud for the current player and game.
  /// [state] must be a JSON-serializable object.
  /// [options] can include `slotKey` and `schemaVersion`.
  external JSPromise<JSAny?> save(JSAny state, [JSPix3lSaveOptions? options]);

  /// Provides access to the PIX3L gamepad input API.
  external JSPix3lInput get input;

  /// Provides access to the PIX3L leaderboards API.
  external JSPix3lLeaderboards get leaderboards;
}

/// Represents a player returned by the PIX3L SDK.
extension type JSPix3lPlayer._(JSObject _) implements JSObject {
  /// The unique identifier of the player.
  external JSString get id;

  /// The display name of the player (may be null).
  external JSString? get username;

  /// The profile avatar URL (may be null).
  // ignore: non_constant_identifier_names
  external JSString? get avatar_url;
}

/// Options passed to [JSPix3l.save].
extension type JSPix3lSaveOptions._(JSObject _) implements JSObject {
  /// Creates an instance of [JSPix3lSaveOptions].
  external factory JSPix3lSaveOptions({
    JSString? slotKey,
    JSString? schemaVersion,
  });

  /// Save slot name.
  external JSString? get slotKey;

  /// Optional version tag for migration.
  external JSString? get schemaVersion;
}

/// Accesses the global [PIX3L] object.
@JS('PIX3L')
// Name matches the JavaScript global variable.
// ignore: non_constant_identifier_names
external JSPix3l get PIX3L;

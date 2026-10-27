import 'dart:js_interop';

/// The PIX3L achievements API exposed via `PIX3L.achievements`.
@JS()
extension type JSPix3lAchievements._(JSObject _) implements JSObject {
  /// Reports incremental progress toward an achievement.
  external void progress(JSString key, [JSNumber? amount]);

  /// Reports an absolute progress value for an achievement.
  external void setProgress(JSString key, JSNumber value);

  /// Fetches every achievement defined for the current game.
  external JSPromise<JSArray<JSPix3lAchievementState>> list();

  /// Subscribes to unlock events.
  /// Returns an unsubscribe function.
  external JSFunction onUnlock(JSFunction callback);
}

/// The state of an achievement for the current player.
@JS()
extension type JSPix3lAchievementState._(JSObject _) implements JSObject {
  /// Stable identifier used to report progress.
  external JSString get key;

  /// Display title from the Studio dashboard.
  external JSString get title;

  /// Optional description shown in achievement lists.
  external JSString? get description;

  /// Progress mode chosen when authoring the achievement.
  external JSString get mode;

  /// Target value required to unlock.
  external JSNumber get target;

  /// Current player progress toward the target.
  external JSNumber get progress;

  /// True once progress >= target.
  external JSBoolean get unlocked;

  /// ISO timestamp of the unlock, or null if still locked.
  external JSString? get unlockedAt;

  /// Whether the achievement is hidden until unlocked.
  external JSBoolean get hidden;

  /// Optional resolved icon URL for the achievement.
  external JSString? get iconUrl;
}

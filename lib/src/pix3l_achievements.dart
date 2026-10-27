import 'dart:js_interop';

import 'package:pix3l/src/js/pix3l_achievements_js.dart';
import 'package:pix3l/src/js/pix3l_js.dart';
import 'package:pix3l/src/models/achievement.dart';

export 'package:pix3l/src/models/achievement.dart';

/// A Dart wrapper for the PIX3L JavaScript SDK achievements API.
///
/// Accessed via `Pix3l.achievements`:
///
/// ```dart
/// Pix3l.achievements.progress('coins_1000', amount: 25);
/// Pix3l.achievements.setProgress('high_score', score);
///
/// final achievements = await Pix3l.achievements.list();
/// ```
///
/// There is intentionally no `unlock` method: unlocks happen on the server
/// as soon as progress reaches the achievement's target.
class Pix3lAchievements {
  /// Creates an instance of [Pix3lAchievements].
  ///
  /// Typically accessed via `Pix3l.achievements` rather than constructed
  /// directly.
  Pix3lAchievements();

  final JSPix3lAchievements _sdk = PIX3L.achievements;

  /// Reports incremental progress toward an achievement.
  ///
  /// [amount] is a positive integer added to the running total
  /// (defaults to `1`). Works with achievements in
  /// [Pix3lAchievementMode.increment] mode. For
  /// [Pix3lAchievementMode.boolean] achievements, a single call unlocks them.
  void progress(String key, {int? amount}) {
    _sdk.progress(key.toJS, amount?.toJS);
  }

  /// Reports an absolute value for an achievement.
  ///
  /// The server keeps the maximum value ever reported; smaller values are
  /// ignored. Works with achievements in [Pix3lAchievementMode.absolute] mode
  /// and is safe to call every frame.
  void setProgress(String key, num value) {
    _sdk.setProgress(key.toJS, value.toJS);
  }

  /// Fetches every achievement defined for the current game, along with the
  /// current player's progress and unlock status.
  Future<List<Pix3lAchievement>> list() async {
    final result = await _sdk.list().toDart;
    return result.toDart.map(_toDartAchievement).toList();
  }

  /// Subscribes to unlock events.
  ///
  /// [callback] fires once per achievement, the moment it unlocks.
  /// Returns a function that removes the listener when called.
  void Function() onUnlock(void Function(Pix3lAchievement) callback) {
    final jsCallback = (JSPix3lAchievementState achievement) {
      callback(_toDartAchievement(achievement));
    }.toJS;
    final unsub = _sdk.onUnlock(jsCallback);
    // Tear-offs of external JS interop members are disallowed.
    // ignore: unnecessary_lambdas
    return () {
      unsub.callAsFunction();
    };
  }

  static Pix3lAchievement _toDartAchievement(JSPix3lAchievementState js) {
    final unlockedAt = js.unlockedAt?.toDart;
    return Pix3lAchievement(
      key: js.key.toDart,
      title: js.title.toDart,
      description: js.description?.toDart,
      mode: Pix3lAchievementMode.fromValue(js.mode.toDart),
      target: js.target.toDartDouble,
      progress: js.progress.toDartDouble,
      unlocked: js.unlocked.toDart,
      unlockedAt: unlockedAt == null ? null : DateTime.tryParse(unlockedAt),
      hidden: js.hidden.toDart,
      iconUrl: js.iconUrl?.toDart,
    );
  }
}

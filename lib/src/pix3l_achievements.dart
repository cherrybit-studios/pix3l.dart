import 'dart:js_interop';

import 'package:pix3l/src/js/pix3l_js.dart';
import 'package:pix3l/src/models/achievement.dart';

/// Provides access to the PIX3L SDK achievements API.
///
/// Use this class to unlock achievements and retrieve the current player's
/// achievement progress.
class Pix3lAchievements {
  /// Creates a [Pix3lAchievements] instance backed by the given JS module.
  const Pix3lAchievements(this._js);

  final JSPix3lAchievements _js;

  /// Unlocks the achievement identified by [achievementId] for the current
  /// player.
  Future<void> unlock(String achievementId) async {
    await _js.unlock(achievementId.toJS).toDart;
  }

  /// Returns all achievements for the game along with their unlock status
  /// for the current player.
  Future<List<Pix3lAchievement>> getAll() async {
    final jsAchievements = await _js.getAll().toDart;
    return [
      for (var i = 0; i < jsAchievements.length; i++)
        _toAchievement(jsAchievements[i]),
    ];
  }

  Pix3lAchievement _toAchievement(JSPix3lAchievement js) => Pix3lAchievement(
    id: js.id.toDart,
    name: js.name.toDart,
    description: js.description.toDart,
    unlocked: js.unlocked.toDart,
  );
}

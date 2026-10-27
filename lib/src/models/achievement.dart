// Dart enums require values to be declared before the constructor.
// ignore_for_file: sort_constructors_first

import 'package:meta/meta.dart';

/// The progress mode of an achievement.
enum Pix3lAchievementMode {
  /// Counter achievement; progress deltas are summed.
  increment('increment'),

  /// Absolute achievement; the maximum reported value is kept.
  absolute('absolute'),

  /// Boolean achievement; any positive report unlocks it.
  boolean('boolean')
  ;

  const Pix3lAchievementMode(this.value);

  /// The string value used by the PIX3L SDK.
  final String value;

  /// Returns the mode matching [value].
  factory Pix3lAchievementMode.fromValue(String value) {
    return values.firstWhere((mode) => mode.value == value);
  }
}

/// Represents an achievement and the current player's progress toward it.
@immutable
class Pix3lAchievement {
  /// Creates a [Pix3lAchievement] with the provided fields.
  const Pix3lAchievement({
    required this.key,
    required this.title,
    required this.mode,
    required this.target,
    required this.progress,
    required this.unlocked,
    required this.hidden,
    this.description,
    this.unlockedAt,
    this.iconUrl,
  });

  /// Stable identifier used to report progress.
  final String key;

  /// Display title from the Studio dashboard.
  final String title;

  /// Optional description shown in achievement lists.
  final String? description;

  /// Progress mode chosen when authoring the achievement.
  final Pix3lAchievementMode mode;

  /// Target value required to unlock.
  final num target;

  /// Current player progress toward the target.
  final num progress;

  /// True once [progress] >= [target].
  final bool unlocked;

  /// When the achievement was unlocked, or null if still locked.
  final DateTime? unlockedAt;

  /// Whether the achievement is hidden until unlocked.
  final bool hidden;

  /// Optional resolved icon URL for the achievement.
  final String? iconUrl;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pix3lAchievement &&
          key == other.key &&
          title == other.title &&
          description == other.description &&
          mode == other.mode &&
          target == other.target &&
          progress == other.progress &&
          unlocked == other.unlocked &&
          unlockedAt == other.unlockedAt &&
          hidden == other.hidden &&
          iconUrl == other.iconUrl;

  @override
  int get hashCode => Object.hash(
    key,
    title,
    description,
    mode,
    target,
    progress,
    unlocked,
    unlockedAt,
    hidden,
    iconUrl,
  );

  @override
  String toString() =>
      'Pix3lAchievement(key: $key, title: $title, '
      'description: $description, mode: $mode, target: $target, '
      'progress: $progress, unlocked: $unlocked, unlockedAt: $unlockedAt, '
      'hidden: $hidden, iconUrl: $iconUrl)';
}

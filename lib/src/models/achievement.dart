import 'package:meta/meta.dart';

/// Represents an achievement in the PIX3L SDK.
@immutable
class Pix3lAchievement {
  /// Creates a [Pix3lAchievement] with the provided fields.
  const Pix3lAchievement({
    required this.id,
    required this.name,
    required this.description,
    required this.unlocked,
  });

  /// The unique identifier of the achievement.
  final String id;

  /// The display name of the achievement.
  final String name;

  /// A description of the achievement.
  final String description;

  /// Whether the achievement has been unlocked by the current player.
  final bool unlocked;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pix3lAchievement &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          unlocked == other.unlocked;

  @override
  int get hashCode => Object.hash(id, name, description, unlocked);

  @override
  String toString() =>
      'Pix3lAchievement(id: $id, name: $name, '
      'description: $description, unlocked: $unlocked)';
}

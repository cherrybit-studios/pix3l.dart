import 'package:meta/meta.dart';

/// Represents a player in the PIX3L SDK.
@immutable
class Pix3lPlayer {
  /// Creates a [Pix3lPlayer] with the provided fields.
  const Pix3lPlayer({
    required this.id,
    this.username,
    this.avatarUrl,
  });

  /// The unique identifier of the player.
  final String id;

  /// The display name of the player (may be null).
  final String? username;

  /// The profile avatar URL (may be null).
  final String? avatarUrl;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pix3lPlayer &&
          id == other.id &&
          username == other.username &&
          avatarUrl == other.avatarUrl;

  @override
  int get hashCode => Object.hash(id, username, avatarUrl);

  @override
  String toString() =>
      'Pix3lPlayer(id: $id, username: $username, '
      'avatarUrl: $avatarUrl)';
}

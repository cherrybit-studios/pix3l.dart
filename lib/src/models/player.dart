import 'package:meta/meta.dart';

/// Represents a player in the PIX3L SDK.
@immutable
class Pix3lPlayer {
  /// Creates a [Pix3lPlayer] with the provided fields.
  const Pix3lPlayer({
    required this.id,
    required this.displayName,
    required this.walletAddress,
  });

  /// The unique identifier of the player.
  final String id;

  /// The display name of the player.
  final String displayName;

  /// The blockchain wallet address associated with the player.
  final String walletAddress;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pix3lPlayer &&
          id == other.id &&
          displayName == other.displayName &&
          walletAddress == other.walletAddress;

  @override
  int get hashCode => Object.hash(id, displayName, walletAddress);

  @override
  String toString() =>
      'Pix3lPlayer(id: $id, displayName: $displayName, '
      'walletAddress: $walletAddress)';
}

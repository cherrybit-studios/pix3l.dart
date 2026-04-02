import 'package:meta/meta.dart';
import 'package:pix3l/src/models/player.dart';

/// Represents a single entry on a PIX3L leaderboard.
@immutable
class Pix3lLeaderboardEntry {
  /// Creates a [Pix3lLeaderboardEntry] with the provided fields.
  const Pix3lLeaderboardEntry({
    required this.rank,
    required this.player,
    required this.score,
  });

  /// The rank of the player in the leaderboard (1-indexed).
  final int rank;

  /// The player associated with this leaderboard entry.
  final Pix3lPlayer player;

  /// The score submitted by the player.
  final double score;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pix3lLeaderboardEntry &&
          rank == other.rank &&
          player == other.player &&
          score == other.score;

  @override
  int get hashCode => Object.hash(rank, player, score);

  @override
  String toString() =>
      'Pix3lLeaderboardEntry(rank: $rank, player: $player, '
      'score: $score)';
}

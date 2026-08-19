// Dart enums require values to be declared before the constructor.
// ignore_for_file: sort_constructors_first

import 'package:meta/meta.dart';
import 'package:pix3l/src/models/player.dart';

/// The scope of a leaderboard query.
enum Pix3lLeaderboardScope {
  /// Global ranking.
  all('all'),

  /// Friends-only ranking.
  friends('friends');

  const Pix3lLeaderboardScope(this.value);

  /// The string value used by the PIX3L SDK.
  final String value;

  /// Returns the scope matching [value].
  factory Pix3lLeaderboardScope.fromValue(String value) {
    return values.firstWhere((scope) => scope.value == value);
  }
}

/// The type of a leaderboard.
enum Pix3lLeaderboardType {
  /// Score-based board where higher is better.
  score('score'),

  /// Time-based board where lower is better.
  time('time'),

  /// Combined board that accepts both score and time.
  both('both');

  const Pix3lLeaderboardType(this.value);

  /// The string value used by the PIX3L SDK.
  final String value;

  /// Returns the type matching [value].
  factory Pix3lLeaderboardType.fromValue(String value) {
    return values.firstWhere((type) => type.value == value);
  }
}

/// The primary metric used for ranking on combined boards.
enum Pix3lLeaderboardPrimaryMetric {
  /// Rank by score.
  score('score'),

  /// Rank by time.
  time('time');

  const Pix3lLeaderboardPrimaryMetric(this.value);

  /// The string value used by the PIX3L SDK.
  final String value;

  /// Returns the primary metric matching [value].
  factory Pix3lLeaderboardPrimaryMetric.fromValue(String value) {
    return values.firstWhere((metric) => metric.value == value);
  }
}

/// Represents the result of a leaderboard submission.
@immutable
class Pix3lLeaderboardSubmitResult {
  /// Creates a [Pix3lLeaderboardSubmitResult] with the provided fields.
  const Pix3lLeaderboardSubmitResult({
    required this.improved,
    required this.rank,
    required this.totalEntries,
    this.score,
    this.timeMs,
  });

  /// Whether this run replaced the previous best.
  final bool improved;

  /// The player's rank after submission.
  final int rank;

  /// The stored best score.
  final num? score;

  /// The stored best time in milliseconds.
  final int? timeMs;

  /// Total entries currently on the board.
  final int totalEntries;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pix3lLeaderboardSubmitResult &&
          improved == other.improved &&
          rank == other.rank &&
          score == other.score &&
          timeMs == other.timeMs &&
          totalEntries == other.totalEntries;

  @override
  int get hashCode => Object.hash(improved, rank, score, timeMs, totalEntries);

  @override
  String toString() =>
      'Pix3lLeaderboardSubmitResult(improved: $improved, rank: $rank, '
      'score: $score, timeMs: $timeMs, totalEntries: $totalEntries)';
}

/// Represents a single ranked entry on a leaderboard.
@immutable
class Pix3lLeaderboardEntry {
  /// Creates a [Pix3lLeaderboardEntry] with the provided fields.
  const Pix3lLeaderboardEntry({
    required this.rank,
    required this.userId,
    required this.playerId,
    required this.username,
    this.score,
    this.timeMs,
    this.avatarUrl,
    this.player,
    this.createdAt,
  });

  /// The rank of this entry.
  final int rank;

  /// The score value, if applicable.
  final num? score;

  /// The time value in milliseconds, if applicable.
  final int? timeMs;

  /// The Player 3 user identifier.
  final String userId;

  /// The player identifier for the game.
  final String playerId;

  /// The display name of the player.
  final String username;

  /// The profile avatar URL, if available.
  final String? avatarUrl;

  /// The player object.
  final Pix3lPlayer? player;

  /// When the entry was created.
  final DateTime? createdAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pix3lLeaderboardEntry &&
          rank == other.rank &&
          score == other.score &&
          timeMs == other.timeMs &&
          userId == other.userId &&
          playerId == other.playerId &&
          username == other.username &&
          avatarUrl == other.avatarUrl &&
          player == other.player &&
          createdAt == other.createdAt;

  @override
  int get hashCode => Object.hash(
    rank,
    score,
    timeMs,
    userId,
    playerId,
    username,
    avatarUrl,
    player,
    createdAt,
  );

  @override
  String toString() =>
      'Pix3lLeaderboardEntry(rank: $rank, score: $score, timeMs: $timeMs, '
      'userId: $userId, playerId: $playerId, username: $username, '
      'avatarUrl: $avatarUrl, player: $player, createdAt: $createdAt)';
}

/// Represents a page of ranked leaderboard entries.
@immutable
class Pix3lLeaderboardTopResult {
  /// Creates a [Pix3lLeaderboardTopResult] with the provided fields.
  const Pix3lLeaderboardTopResult({
    required this.key,
    required this.scope,
    required this.limit,
    required this.offset,
    required this.entries,
  });

  /// The board key that was queried.
  final String key;

  /// The scope applied to the query.
  final Pix3lLeaderboardScope scope;

  /// Page size used.
  final int limit;

  /// Offset used.
  final int offset;

  /// Ranked rows with rank, username, score, and timeMs.
  final List<Pix3lLeaderboardEntry> entries;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pix3lLeaderboardTopResult &&
          key == other.key &&
          scope == other.scope &&
          limit == other.limit &&
          offset == other.offset &&
          _listEquals(entries, other.entries);

  @override
  int get hashCode =>
      Object.hash(key, scope, limit, offset, Object.hashAll(entries));

  @override
  String toString() =>
      'Pix3lLeaderboardTopResult(key: $key, scope: $scope, '
      'limit: $limit, offset: $offset, entries: $entries)';
}

/// Represents the current player's rank and stored best result on a board.
@immutable
class Pix3lLeaderboardMyRankResult {
  /// Creates a [Pix3lLeaderboardMyRankResult] with the provided fields.
  const Pix3lLeaderboardMyRankResult({
    required this.totalEntries,
    this.rank,
    this.score,
    this.timeMs,
  });

  /// Current rank, or null when no entry exists.
  final int? rank;

  /// The player's stored best score.
  final num? score;

  /// The player's stored best time.
  final int? timeMs;

  /// Total entries in the requested scope.
  final int totalEntries;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pix3lLeaderboardMyRankResult &&
          rank == other.rank &&
          score == other.score &&
          timeMs == other.timeMs &&
          totalEntries == other.totalEntries;

  @override
  int get hashCode => Object.hash(rank, score, timeMs, totalEntries);

  @override
  String toString() =>
      'Pix3lLeaderboardMyRankResult(rank: $rank, score: $score, '
      'timeMs: $timeMs, totalEntries: $totalEntries)';
}

/// Represents an active leaderboard definition for the current game.
@immutable
class Pix3lLeaderboardDefinition {
  /// Creates a [Pix3lLeaderboardDefinition] with the provided fields.
  const Pix3lLeaderboardDefinition({
    required this.key,
    required this.name,
    required this.boardType,
    required this.primaryMetric,
  });

  /// Stable board identifier used in every other call.
  final String key;

  /// Display name authored in the Studio Dashboard.
  final String name;

  /// Which metrics the board accepts.
  final Pix3lLeaderboardType boardType;

  /// The metric used for ranking on combined boards.
  final Pix3lLeaderboardPrimaryMetric primaryMetric;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pix3lLeaderboardDefinition &&
          key == other.key &&
          name == other.name &&
          boardType == other.boardType &&
          primaryMetric == other.primaryMetric;

  @override
  int get hashCode => Object.hash(key, name, boardType, primaryMetric);

  @override
  String toString() =>
      'Pix3lLeaderboardDefinition(key: $key, name: $name, '
      'boardType: $boardType, primaryMetric: $primaryMetric)';
}

bool _listEquals<T>(List<T> a, List<T> b) {
  if (identical(a, b)) return true;
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}

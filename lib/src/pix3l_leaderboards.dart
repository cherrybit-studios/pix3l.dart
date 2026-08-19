import 'dart:js_interop';

import 'package:pix3l/src/js/pix3l_js.dart';
import 'package:pix3l/src/js/pix3l_leaderboards_js.dart';
import 'package:pix3l/src/models/leaderboard.dart';
import 'package:pix3l/src/models/player.dart';

export 'package:pix3l/src/models/leaderboard.dart';

/// A Dart wrapper for the PIX3L JavaScript SDK leaderboards API.
///
/// Accessed via `Pix3l.leaderboards`:
///
/// ```dart
/// final result = await Pix3l.leaderboards.submitScore(
///   'high_score',
///   128400,
/// );
///
/// final board = await Pix3l.leaderboards.top('high_score', limit: 10);
/// ```
class Pix3lLeaderboards {
  /// Creates an instance of [Pix3lLeaderboards].
  ///
  /// Typically accessed via `Pix3l.leaderboards` rather than constructed
  /// directly.
  Pix3lLeaderboards();

  final JSPix3lLeaderboards _sdk = PIX3L.leaderboards;

  /// Submits a run result to a board.
  ///
  /// Provide [score], [timeMs], or both, depending on the board type. The
  /// server keeps the result only if it beats the player's existing entry.
  ///
  /// [metadata] must be a JSON-serializable object.
  Future<Pix3lLeaderboardSubmitResult> submit(
    String key, {
    num? score,
    int? timeMs,
    Map<String, dynamic>? metadata,
  }) async {
    final jsMetadata = _jsifyMetadata(metadata);
    final payload = JSPix3lLeaderboardSubmitPayload(
      score: score?.toJS,
      timeMs: timeMs?.toJS,
      metadata: jsMetadata,
    );
    final result = await _sdk.submit(key.toJS, payload).toDart;
    return _toDartSubmitResult(result);
  }

  /// Shortcut for submitting a score to a score-based board.
  ///
  /// [metadata] must be a JSON-serializable object.
  Future<Pix3lLeaderboardSubmitResult> submitScore(
    String key,
    num score, {
    Map<String, dynamic>? metadata,
  }) async {
    final jsMetadata = _jsifyMetadata(metadata);
    final result = await _sdk
        .submitScore(
          key.toJS,
          score.toJS,
          jsMetadata,
        )
        .toDart;
    return _toDartSubmitResult(result);
  }

  /// Shortcut for submitting a time to a time-based board.
  ///
  /// [timeMs] is the elapsed time in milliseconds.
  /// [metadata] must be a JSON-serializable object.
  Future<Pix3lLeaderboardSubmitResult> submitTime(
    String key,
    int timeMs, {
    Map<String, dynamic>? metadata,
  }) async {
    final jsMetadata = _jsifyMetadata(metadata);
    final result = await _sdk
        .submitTime(
          key.toJS,
          timeMs.toJS,
          jsMetadata,
        )
        .toDart;
    return _toDartSubmitResult(result);
  }

  /// Fetches a page of ranked entries for a board.
  ///
  /// [limit] is the number of rows to return (defaults to `10`).
  /// [offset] is the row offset for pagination (defaults to `0`).
  /// [scope] selects global or friends-only ranking.
  Future<Pix3lLeaderboardTopResult> top(
    String key, {
    int limit = 10,
    int offset = 0,
    Pix3lLeaderboardScope scope = Pix3lLeaderboardScope.all,
  }) async {
    final options = JSPix3lLeaderboardTopOptions(
      limit: limit.toJS,
      offset: offset.toJS,
      scope: scope.value.toJS,
    );
    final result = await _sdk.top(key.toJS, options).toDart;
    return Pix3lLeaderboardTopResult(
      key: result.key.toDart,
      scope: Pix3lLeaderboardScope.fromValue(result.scope.toDart),
      limit: result.limit.toDartInt,
      offset: result.offset.toDartInt,
      entries: result.entries.toDart.map(_toDartEntry).toList(),
    );
  }

  /// Fetches the current player's rank and stored best result on a board.
  ///
  /// [scope] selects global or friends-only ranking.
  Future<Pix3lLeaderboardMyRankResult> myRank(
    String key, {
    Pix3lLeaderboardScope scope = Pix3lLeaderboardScope.all,
  }) async {
    final options = JSPix3lLeaderboardMyRankOptions(
      scope: scope.value.toJS,
    );
    final result = await _sdk.myRank(key.toJS, options).toDart;
    return Pix3lLeaderboardMyRankResult(
      rank: result.rank?.toDartInt,
      score: result.score?.toDartDouble,
      timeMs: result.timeMs?.toDartInt,
      totalEntries: result.totalEntries.toDartInt,
    );
  }

  /// Fetches every active board definition for the current game.
  Future<List<Pix3lLeaderboardDefinition>> list() async {
    final result = await _sdk.list().toDart;
    return result.toDart.map(_toDartDefinition).toList();
  }

  static JSAny? _jsifyMetadata(Map<String, dynamic>? metadata) {
    if (metadata == null) return null;
    final jsMetadata = metadata.jsify();
    if (jsMetadata == null) {
      throw ArgumentError('metadata must be a JSON-serializable object.');
    }
    return jsMetadata;
  }

  static Pix3lLeaderboardSubmitResult _toDartSubmitResult(
    JSPix3lLeaderboardSubmitResult result,
  ) {
    return Pix3lLeaderboardSubmitResult(
      improved: result.improved.toDart,
      rank: result.rank.toDartInt,
      score: result.score?.toDartDouble,
      timeMs: result.timeMs?.toDartInt,
      totalEntries: result.totalEntries.toDartInt,
    );
  }

  static Pix3lLeaderboardEntry _toDartEntry(JSPix3lLeaderboardEntry entry) {
    return Pix3lLeaderboardEntry(
      rank: entry.rank.toDartInt,
      score: entry.score?.toDartDouble,
      timeMs: entry.timeMs?.toDartInt,
      userId: entry.userId.toDart,
      playerId: entry.playerId.toDart,
      username: entry.username.toDart,
      avatarUrl: entry.avatarUrl?.toDart,
      player: entry.player == null ? null : _toDartPlayer(entry.player!),
      createdAt: _parseCreatedAt(entry.createdAt?.toDart),
    );
  }

  static Pix3lPlayer _toDartPlayer(JSPix3lLeaderboardPlayer player) {
    return Pix3lPlayer(
      id: player.id.toDart,
      username: player.username?.toDart,
      avatarUrl: player.avatarUrl?.toDart,
    );
  }

  static DateTime? _parseCreatedAt(String? value) {
    if (value == null) return null;
    return DateTime.tryParse(value);
  }

  static Pix3lLeaderboardDefinition _toDartDefinition(
    JSPix3lLeaderboardDefinition definition,
  ) {
    return Pix3lLeaderboardDefinition(
      key: definition.key.toDart,
      name: definition.name.toDart,
      boardType: Pix3lLeaderboardType.fromValue(definition.board_type.toDart),
      primaryMetric: Pix3lLeaderboardPrimaryMetric.fromValue(
        definition.primary_metric.toDart,
      ),
    );
  }
}

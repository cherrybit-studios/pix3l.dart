import 'dart:js_interop';

/// The PIX3L leaderboards API exposed via `PIX3L.leaderboards`.
@JS()
extension type JSPix3lLeaderboards._(JSObject _) implements JSObject {
  /// Submits a run result to a board.
  external JSPromise<JSPix3lLeaderboardSubmitResult> submit(
    JSString key,
    JSPix3lLeaderboardSubmitPayload payload,
  );

  /// Shortcut for submitting a score to a score-based board.
  external JSPromise<JSPix3lLeaderboardSubmitResult> submitScore(
    JSString key,
    JSNumber score, [
    JSAny? metadata,
  ]);

  /// Shortcut for submitting a time to a time-based board.
  external JSPromise<JSPix3lLeaderboardSubmitResult> submitTime(
    JSString key,
    JSNumber timeMs, [
    JSAny? metadata,
  ]);

  /// Fetches a page of ranked entries for a board.
  external JSPromise<JSPix3lLeaderboardTopResult> top(
    JSString key, [
    JSPix3lLeaderboardTopOptions? options,
  ]);

  /// Fetches the current player's rank and stored best result on a board.
  external JSPromise<JSPix3lLeaderboardMyRankResult> myRank(
    JSString key, [
    JSPix3lLeaderboardMyRankOptions? options,
  ]);

  /// Fetches every active board definition for the current game.
  external JSPromise<JSArray<JSPix3lLeaderboardDefinition>> list();
}

/// Payload passed to [JSPix3lLeaderboards.submit].
@JS()
extension type JSPix3lLeaderboardSubmitPayload._(JSObject _)
    implements JSObject {
  /// Creates an instance of [JSPix3lLeaderboardSubmitPayload].
  external factory JSPix3lLeaderboardSubmitPayload({
    JSNumber? score,
    JSNumber? timeMs,
    JSAny? metadata,
  });

  /// Score value for score or combined boards.
  external JSNumber? get score;

  /// Elapsed time in milliseconds.
  external JSNumber? get timeMs;

  /// Optional JSON-serializable context.
  external JSAny? get metadata;
}

/// Options passed to [JSPix3lLeaderboards.top].
@JS()
extension type JSPix3lLeaderboardTopOptions._(JSObject _) implements JSObject {
  /// Creates an instance of [JSPix3lLeaderboardTopOptions].
  external factory JSPix3lLeaderboardTopOptions({
    JSNumber? limit,
    JSNumber? offset,
    JSString? scope,
  });

  /// Number of rows to return.
  external JSNumber? get limit;

  /// Row offset for pagination.
  external JSNumber? get offset;

  /// Global ranking or friends-only ranking.
  external JSString? get scope;
}

/// Options passed to [JSPix3lLeaderboards.myRank].
@JS()
extension type JSPix3lLeaderboardMyRankOptions._(JSObject _)
    implements JSObject {
  /// Creates an instance of [JSPix3lLeaderboardMyRankOptions].
  external factory JSPix3lLeaderboardMyRankOptions({
    JSString? scope,
  });

  /// Global ranking or friends-only ranking.
  external JSString? get scope;
}

/// Result returned by leaderboard submission methods.
@JS()
extension type JSPix3lLeaderboardSubmitResult._(JSObject _)
    implements JSObject {
  /// Whether this run replaced the previous best.
  external JSBoolean get improved;

  /// The player's rank after submission.
  external JSNumber get rank;

  /// The stored best score.
  external JSNumber? get score;

  /// The stored best time in milliseconds.
  external JSNumber? get timeMs;

  /// Total entries currently on the board.
  external JSNumber get totalEntries;
}

/// Result returned by [JSPix3lLeaderboards.top].
@JS()
extension type JSPix3lLeaderboardTopResult._(JSObject _) implements JSObject {
  /// The board key that was queried.
  external JSString get key;

  /// The scope applied to the query.
  external JSString get scope;

  /// Page size used.
  external JSNumber get limit;

  /// Offset used.
  external JSNumber get offset;

  /// Ranked rows with rank, username, score, and timeMs.
  external JSArray<JSPix3lLeaderboardEntry> get entries;
}

/// A single ranked entry on a leaderboard.
@JS()
extension type JSPix3lLeaderboardEntry._(JSObject _) implements JSObject {
  /// The rank of this entry.
  external JSNumber get rank;

  /// The score value, if applicable.
  external JSNumber? get score;

  /// The time value in milliseconds, if applicable.
  external JSNumber? get timeMs;

  /// The Player 3 user identifier.
  external JSString get userId;

  /// The player identifier for the game.
  external JSString get playerId;

  /// The display name of the player.
  external JSString get username;

  /// The profile avatar URL, if available.
  external JSString? get avatarUrl;

  /// The player object.
  external JSPix3lLeaderboardPlayer? get player;

  /// The ISO 8601 timestamp when the entry was created.
  external JSString? get createdAt;
}

/// Player information embedded in a leaderboard entry.
@JS()
extension type JSPix3lLeaderboardPlayer._(JSObject _) implements JSObject {
  /// The unique identifier of the player.
  external JSString get id;

  /// The display name of the player (may be null).
  external JSString? get username;

  /// The profile avatar URL (may be null).
  external JSString? get avatarUrl;
}

/// Result returned by [JSPix3lLeaderboards.myRank].
@JS()
extension type JSPix3lLeaderboardMyRankResult._(JSObject _)
    implements JSObject {
  /// Current rank, or null when no entry exists.
  external JSNumber? get rank;

  /// The player's stored best score.
  external JSNumber? get score;

  /// The player's stored best time.
  external JSNumber? get timeMs;

  /// Total entries in the requested scope.
  external JSNumber get totalEntries;
}

/// Definition of an active leaderboard for the current game.
@JS()
extension type JSPix3lLeaderboardDefinition._(JSObject _) implements JSObject {
  /// Stable board identifier used in every other call.
  external JSString get key;

  /// Display name authored in the Studio Dashboard.
  external JSString get name;

  /// Which metrics the board accepts.
  // ignore: non_constant_identifier_names
  external JSString get board_type;

  /// The metric used for ranking on combined boards.
  // ignore: non_constant_identifier_names
  external JSString get primary_metric;
}

import 'dart:js_interop';

import 'package:pix3l/src/js/pix3l_js.dart';
import 'package:pix3l/src/models/leaderboard_entry.dart';
import 'package:pix3l/src/models/player.dart';

/// Provides access to the PIX3L SDK leaderboard API.
///
/// Use this class to submit scores and retrieve leaderboard entries.
class Pix3lLeaderboard {
  /// Creates a [Pix3lLeaderboard] instance backed by the given JS module.
  const Pix3lLeaderboard(this._js);

  final JSPix3lLeaderboard _js;

  /// Submits [score] for the current player to the leaderboard identified by
  /// [leaderboardId].
  Future<void> submitScore({
    required String leaderboardId,
    required double score,
  }) async {
    await _js.submitScore(leaderboardId.toJS, score.toJS).toDart;
  }

  /// Returns entries for the leaderboard identified by [leaderboardId].
  ///
  /// Use [limit] to restrict the number of entries returned and [offset] to
  /// paginate through results.
  Future<List<Pix3lLeaderboardEntry>> getEntries(
    String leaderboardId, {
    int? limit,
    int? offset,
  }) async {
    final options = (limit != null || offset != null)
        ? JSPix3lLeaderboardGetEntriesOptions(
            limit: limit?.toJS,
            offset: offset?.toJS,
          )
        : null;

    final jsEntries = await _js.getEntries(leaderboardId.toJS, options).toDart;
    return [
      for (var i = 0; i < jsEntries.length; i++) _toEntry(jsEntries[i]),
    ];
  }

  Pix3lLeaderboardEntry _toEntry(JSPix3lLeaderboardEntry js) =>
      Pix3lLeaderboardEntry(
        rank: js.rank.toDartInt,
        player: _toPlayer(js.player),
        score: js.score.toDartDouble,
      );

  Pix3lPlayer _toPlayer(JSPix3lPlayer js) => Pix3lPlayer(
    id: js.id.toDart,
    displayName: js.displayName.toDart,
    walletAddress: js.walletAddress.toDart,
  );
}

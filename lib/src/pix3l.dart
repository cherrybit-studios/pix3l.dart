import 'dart:js_interop';

import 'package:pix3l/src/js/pix3l_js.dart';
import 'package:pix3l/src/models/player.dart';
import 'package:pix3l/src/pix3l_achievements.dart';
import 'package:pix3l/src/pix3l_assets.dart';
import 'package:pix3l/src/pix3l_leaderboard.dart';

export 'package:pix3l/src/models/achievement.dart';
export 'package:pix3l/src/models/asset.dart';
export 'package:pix3l/src/models/leaderboard_entry.dart';
export 'package:pix3l/src/models/player.dart';
export 'package:pix3l/src/pix3l_achievements.dart';
export 'package:pix3l/src/pix3l_assets.dart';
export 'package:pix3l/src/pix3l_leaderboard.dart';

/// {@template pix3l}
/// A Dart wrapper for the PIX3L JavaScript SDK by Player3.
///
/// Initialize the SDK once at the start of your application using [Pix3l.init]
/// and then use the returned instance to interact with player identity,
/// achievements, leaderboards, and digital assets.
///
/// ```dart
/// final pix3l = await Pix3l.init(gameId: 'your-game-id');
/// final player = await pix3l.authenticate();
/// await pix3l.achievements.unlock('first-win');
/// ```
/// {@endtemplate}
class Pix3l {
  Pix3l._(this._sdk)
    : achievements = Pix3lAchievements(_sdk.achievements),
      leaderboard = Pix3lLeaderboard(_sdk.leaderboard),
      assets = Pix3lAssets(_sdk.assets);

  final JSPix3lSdk _sdk;

  /// Provides access to the achievements API.
  final Pix3lAchievements achievements;

  /// Provides access to the leaderboard API.
  final Pix3lLeaderboard leaderboard;

  /// Provides access to the digital assets API.
  final Pix3lAssets assets;

  /// Initializes the PIX3L SDK for the game identified by [gameId] and
  /// returns a [Pix3l] instance ready to use.
  ///
  /// Call this once when your application starts.
  static Future<Pix3l> init({required String gameId}) async {
    final jsSdk = await JSPix3l.init(
      JSPix3lInitOptions(gameId: gameId.toJS),
    ).toDart;
    return Pix3l._(jsSdk);
  }

  /// Authenticates the current player and returns their [Pix3lPlayer] data.
  ///
  /// Under the hood this manages non-custodial wallets so players do not need
  /// to interact with any blockchain concepts directly.
  Future<Pix3lPlayer> authenticate() async {
    final jsPlayer = await _sdk.authenticate().toDart;
    return Pix3lPlayer(
      id: jsPlayer.id.toDart,
      displayName: jsPlayer.displayName.toDart,
      walletAddress: jsPlayer.walletAddress.toDart,
    );
  }
}

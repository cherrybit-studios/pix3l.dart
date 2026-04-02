import 'dart:js_interop';

/// The global [JSPix3l] object exposed by the PIX3L JavaScript SDK.
@JS('Pix3l')
extension type JSPix3l._(JSObject _) implements JSObject {
  /// Initializes the PIX3L SDK with the provided [options] and returns a
  /// promise that resolves to the SDK instance.
  external static JSPromise<JSPix3lSdk> init(JSPix3lInitOptions options);
}

/// Options passed to [JSPix3l.init].
extension type JSPix3lInitOptions._(JSObject _) implements JSObject {
  /// Creates an instance of [JSPix3lInitOptions].
  external factory JSPix3lInitOptions({
    required JSString gameId,
  });

  /// The unique identifier for the game registered in the Player3 dashboard.
  external JSString get gameId;
}

/// The PIX3L SDK instance returned by [JSPix3l.init].
extension type JSPix3lSdk._(JSObject _) implements JSObject {
  /// The [JSPix3lAchievements] module for managing player achievements.
  external JSPix3lAchievements get achievements;

  /// The [JSPix3lLeaderboard] module for managing leaderboards.
  external JSPix3lLeaderboard get leaderboard;

  /// The [JSPix3lAssets] module for managing player digital assets.
  external JSPix3lAssets get assets;

  /// Authenticates the current player and resolves to their [JSPix3lPlayer]
  /// data.
  external JSPromise<JSPix3lPlayer> authenticate();
}

/// Represents a player returned by the PIX3L SDK.
extension type JSPix3lPlayer._(JSObject _) implements JSObject {
  /// The unique identifier of the player.
  external JSString get id;

  /// The display name of the player.
  external JSString get displayName;

  /// The blockchain wallet address associated with the player.
  external JSString get walletAddress;
}

/// The achievements module of the PIX3L SDK.
extension type JSPix3lAchievements._(JSObject _) implements JSObject {
  /// Unlocks the achievement with the given [achievementId] for the current
  /// player.
  external JSPromise<JSAny?> unlock(JSString achievementId);

  /// Retrieves all achievements available for the game along with their
  /// current unlock status for the player.
  external JSPromise<JSArray<JSPix3lAchievement>> getAll();
}

/// Represents a single achievement in the PIX3L SDK.
extension type JSPix3lAchievement._(JSObject _) implements JSObject {
  /// The unique identifier of the achievement.
  external JSString get id;

  /// The display name of the achievement.
  external JSString get name;

  /// A description of the achievement.
  external JSString get description;

  /// Whether the achievement has been unlocked by the current player.
  external JSBoolean get unlocked;
}

/// The leaderboard module of the PIX3L SDK.
extension type JSPix3lLeaderboard._(JSObject _) implements JSObject {
  /// Submits a [score] for the current player to the leaderboard identified
  /// by [leaderboardId].
  external JSPromise<JSAny?> submitScore(
    JSString leaderboardId,
    JSNumber score,
  );

  /// Retrieves the entries for the leaderboard identified by [leaderboardId].
  external JSPromise<JSArray<JSPix3lLeaderboardEntry>> getEntries(
    JSString leaderboardId,
    JSPix3lLeaderboardGetEntriesOptions? options,
  );
}

/// Options passed to [JSPix3lLeaderboard.getEntries].
extension type JSPix3lLeaderboardGetEntriesOptions._(JSObject _)
    implements JSObject {
  /// Creates an instance of [JSPix3lLeaderboardGetEntriesOptions].
  external factory JSPix3lLeaderboardGetEntriesOptions({
    JSNumber? limit,
    JSNumber? offset,
  });

  /// Maximum number of entries to return.
  external JSNumber? get limit;

  /// Number of entries to skip.
  external JSNumber? get offset;
}

/// Represents a single leaderboard entry in the PIX3L SDK.
extension type JSPix3lLeaderboardEntry._(JSObject _) implements JSObject {
  /// The rank of the player in the leaderboard.
  external JSNumber get rank;

  /// The [JSPix3lPlayer] data for this entry.
  external JSPix3lPlayer get player;

  /// The score for this entry.
  external JSNumber get score;
}

/// The digital assets module of the PIX3L SDK.
extension type JSPix3lAssets._(JSObject _) implements JSObject {
  /// Retrieves the current player's digital asset inventory.
  external JSPromise<JSArray<JSPix3lAsset>> getInventory();

  /// Grants the asset identified by [assetId] to the current player.
  external JSPromise<JSAny?> grant(JSString assetId);

  /// Transfers the asset identified by [assetId] to the player identified
  /// by [toPlayerId].
  external JSPromise<JSAny?> transfer(
    JSString assetId,
    JSString toPlayerId,
  );
}

/// Represents a single digital asset (NFT) in the PIX3L SDK.
extension type JSPix3lAsset._(JSObject _) implements JSObject {
  /// The unique identifier of the asset.
  external JSString get id;

  /// The display name of the asset.
  external JSString get name;

  /// A description of the asset.
  external JSString get description;

  /// A URI pointing to the asset's metadata or image.
  external JSString get imageUri;
}

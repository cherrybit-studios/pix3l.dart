# pix3l.dart

A Dart/Flutter wrapper around the [PIX3L JavaScript SDK](https://player3.gg/pix3l-sdk) by [Player3](https://player3.gg).

## About

[PIX3L](https://player3.gg/pix3l-sdk) is a lightweight JavaScript API available inside the Player 3 embedded game environment. It gives your game secure access to player identity and a cloud save/load system.

This package exposes the PIX3L SDK to Dart and Flutter applications, bridging the JS SDK so you can call its API from your Dart codebase using JS interop.

## How it works

The PIX3L SDK is injected into the Player 3 runtime automatically. You do not need to install any packages, add script tags, or configure anything. Under the hood it communicates with the Player 3 platform to handle:

- **Player identity** – retrieve the authenticated player's ID, username, and avatar.
- **Cloud saves** – persist and restore game state per player, per game, with named save slots.
- **Gamepad input** – read normalized controller state (buttons, sticks, triggers) with automatic detection and edge-state tracking.
- **Leaderboards** – submit scores and times, read global and friends rankings, and list board definitions.
- **Achievements** – report incremental or absolute progress, list achievements with player progress, and react to unlocks.

For full details see the [official PIX3L SDK documentation](https://player3.gg/pix3l-sdk).

## Getting started

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  pix3l: ^0.1.0
```

Then run:

```sh
flutter pub get
```

## Usage

The PIX3L SDK is available automatically in the Player 3 runtime. No initialization is required.

```dart
import 'package:pix3l/pix3l.dart';

// Get the authenticated player
final player = await Pix3l.getPlayer();
print(player.id);       // "a1b2c3d4-..."
print(player.username); // "PixelNinja42"

// Save game state
await Pix3l.save(
  {'level': 3, 'score': 7200},
  slotKey: 'autosave',
  schemaVersion: '1.2',
);

// Load game state
final save = await Pix3l.load(slotKey: 'autosave');
if (save != null) {
  print(save['level']); // 3
}
```

### Gamepad Input

Read normalized controller state inside your game loop:

```dart
// Get all connected controllers
final controllers = Pix3l.input.getControllers();

// Get the first controller
final pad = Pix3l.input.getController();

if (pad != null) {
  if (pad.buttons.a.justPressed) {
    player.jump();
  }

  // Move with left stick
  player.x += pad.sticks.left.x * speed;
  player.y += pad.sticks.left.y * speed;
}
```

Subscribe to input changes:

```dart
final unsub = Pix3l.input.onChange((controllers) {
  final pad = controllers.firstOrNull;
  if (pad?.buttons.start.justPressed ?? false) {
    togglePauseMenu();
  }
});

// Later: stop listening
unsub();
```

### Leaderboards

Submit scores and times at the end of a run, then read rankings back:

```dart
// Submit a high score
final result = await Pix3l.leaderboards.submitScore(
  'high_score',
  128400,
  metadata: {'level': currentLevel},
);

if (result.improved) {
  showToast('New personal best! Rank #${result.rank}');
}

// Submit a speedrun time (timeMs is in milliseconds)
final timeResult = await Pix3l.leaderboards.submitTime(
  'track_01_time',
  runDuration.inMilliseconds,
);

// Read the top ten global entries
final board = await Pix3l.leaderboards.top('high_score', limit: 10);
for (final entry in board.entries) {
  print('#${entry.rank} ${entry.username}: ${entry.score}');
}

// Show the player's standing among friends
final me = await Pix3l.leaderboards.myRank(
  'high_score',
  scope: Pix3lLeaderboardScope.friends,
);

if (me.rank != null) {
  print('You are #${me.rank} of ${me.totalEntries}');
}

// Build a leaderboard menu from the board catalog
final boards = await Pix3l.leaderboards.list();
for (final board in boards) {
  addMenuEntry(board.name, () => showLeaderboard(board.key));
}
```

### Achievements

Report progress from gameplay; Player 3 validates reports server-side and unlocks achievements automatically when their target is reached:

```dart
// Increment a counter (defaults to 1)
Pix3l.achievements.progress('coins_1000');
Pix3l.achievements.progress('coins_1000', amount: 25);

// Boolean achievements unlock with a single report
Pix3l.achievements.progress('first_boss');

// Report an absolute value; the server keeps the maximum
Pix3l.achievements.setProgress('high_score', score);

// Render an achievements screen
final achievements = await Pix3l.achievements.list();
for (final achievement in achievements) {
  print(
    '${achievement.title} ${achievement.progress}/${achievement.target}',
  );
}

// Celebrate unlocks
final off = Pix3l.achievements.onUnlock((achievement) {
  playSfx('fanfare');
  showBanner('Unlocked: ${achievement.title}');
});

// Later: stop listening
off();
```

## License

See [LICENSE](LICENSE).

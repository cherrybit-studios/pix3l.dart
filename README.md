# pix3l.dart

A Dart/Flutter wrapper around the [PIX3L JavaScript SDK](https://player3.gg/pix3l-sdk) by [Player3](https://player3.gg).

## About

[PIX3L](https://player3.gg/pix3l-sdk) is a lightweight JavaScript API available inside the Player 3 embedded game environment. It gives your game secure access to player identity and a cloud save/load system.

This package exposes the PIX3L SDK to Dart and Flutter applications, bridging the JS SDK so you can call its API from your Dart codebase using JS interop.

## How it works

The PIX3L SDK is injected into the Player 3 runtime automatically. You do not need to install any packages, add script tags, or configure anything. Under the hood it communicates with the Player 3 platform to handle:

- **Player identity** – retrieve the authenticated player's ID, username, and avatar.
- **Cloud saves** – persist and restore game state per player, per game, with named save slots.

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

## License

See [LICENSE](LICENSE).

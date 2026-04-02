# pix3l.dart

A Dart/Flutter wrapper around the [Pix3l JavaScript SDK](https://player3.gg/pix3l-sdk) by [Player3](https://player3.gg).

## About

[Pix3l](https://player3.gg/pix3l-sdk) is a JavaScript SDK that lets game developers integrate on-chain features — such as achievements, leaderboards, and digital asset ownership — directly into their games without requiring players to manage wallets or understand blockchain concepts.

This package exposes the Pix3l SDK to Dart and Flutter applications, bridging the JS SDK so you can call its API from your Dart codebase using platform channels / JS interop.

## How it works

The Pix3l SDK works by embedding a lightweight JS layer in your game. Under the hood it communicates with the Player3 network to handle:

- **Player identity** – non-custodial, invisible wallets tied to a player's existing account.
- **Achievements & quests** – award on-chain badges and track quest progress.
- **Leaderboards** – globally verifiable, tamper-proof score boards.
- **Digital ownership** – mint and transfer in-game items as NFTs.

For full details see the [official Pix3l SDK documentation](https://player3.gg/pix3l-sdk#how-it-works).

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

## License

See [LICENSE](LICENSE).

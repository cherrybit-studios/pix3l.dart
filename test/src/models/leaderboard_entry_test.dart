// Tests use non-const constructors to test equality between instances.
// ignore_for_file: prefer_const_constructors

import 'package:pix3l/src/models/leaderboard_entry.dart';
import 'package:pix3l/src/models/player.dart';
import 'package:test/test.dart';

void main() {
  group('Pix3lLeaderboardEntry', () {
    Pix3lPlayer player() => Pix3lPlayer(
      id: 'player-1',
      displayName: 'Alice',
      walletAddress: '0xABC',
    );

    test('can be instantiated', () {
      expect(
        Pix3lLeaderboardEntry(rank: 1, player: player(), score: 1000),
        isNotNull,
      );
    });

    test('equality', () {
      final a = Pix3lLeaderboardEntry(rank: 1, player: player(), score: 1000);
      final b = Pix3lLeaderboardEntry(rank: 1, player: player(), score: 1000);

      expect(a, equals(b));
    });

    test('inequality when score differs', () {
      final a = Pix3lLeaderboardEntry(rank: 1, player: player(), score: 1000);
      final b = Pix3lLeaderboardEntry(rank: 1, player: player(), score: 2000);

      expect(a, isNot(equals(b)));
    });

    test('hashCode is consistent with equality', () {
      final a = Pix3lLeaderboardEntry(rank: 1, player: player(), score: 1000);
      final b = Pix3lLeaderboardEntry(rank: 1, player: player(), score: 1000);

      expect(a.hashCode, equals(b.hashCode));
    });

    test('toString contains all fields', () {
      final entry = Pix3lLeaderboardEntry(
        rank: 1,
        player: player(),
        score: 1000,
      );
      final str = entry.toString();

      expect(str, contains('1'));
      expect(str, contains('1000'));
    });
  });
}

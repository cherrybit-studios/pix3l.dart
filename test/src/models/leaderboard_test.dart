// Tests use non-const constructors to test equality between instances.
// ignore_for_file: prefer_const_constructors

import 'package:pix3l/src/models/leaderboard.dart';
import 'package:pix3l/src/models/player.dart';
import 'package:test/test.dart';

void main() {
  group('Pix3lLeaderboardScope', () {
    test('all has the correct value', () {
      expect(Pix3lLeaderboardScope.all.value, equals('all'));
    });

    test('friends has the correct value', () {
      expect(Pix3lLeaderboardScope.friends.value, equals('friends'));
    });

    test('fromValue returns the matching scope', () {
      expect(
        Pix3lLeaderboardScope.fromValue('friends'),
        equals(Pix3lLeaderboardScope.friends),
      );
    });
  });

  group('Pix3lLeaderboardType', () {
    test('values match the JS strings', () {
      expect(Pix3lLeaderboardType.score.value, equals('score'));
      expect(Pix3lLeaderboardType.time.value, equals('time'));
      expect(Pix3lLeaderboardType.both.value, equals('both'));
    });

    test('fromValue returns the matching type', () {
      expect(
        Pix3lLeaderboardType.fromValue('both'),
        equals(Pix3lLeaderboardType.both),
      );
    });
  });

  group('Pix3lLeaderboardPrimaryMetric', () {
    test('values match the JS strings', () {
      expect(Pix3lLeaderboardPrimaryMetric.score.value, equals('score'));
      expect(Pix3lLeaderboardPrimaryMetric.time.value, equals('time'));
    });

    test('fromValue returns the matching metric', () {
      expect(
        Pix3lLeaderboardPrimaryMetric.fromValue('time'),
        equals(Pix3lLeaderboardPrimaryMetric.time),
      );
    });
  });

  group('Pix3lLeaderboardSubmitResult', () {
    test('can be instantiated', () {
      expect(
        Pix3lLeaderboardSubmitResult(
          improved: true,
          rank: 1,
          score: 128400,
          timeMs: 92350,
          totalEntries: 42,
        ),
        isNotNull,
      );
    });

    test('can be instantiated with null optional fields', () {
      expect(
        Pix3lLeaderboardSubmitResult(
          improved: false,
          rank: 5,
          totalEntries: 10,
        ),
        isNotNull,
      );
    });

    test('equality', () {
      final a = Pix3lLeaderboardSubmitResult(
        improved: true,
        rank: 1,
        score: 128400,
        totalEntries: 42,
      );
      final b = Pix3lLeaderboardSubmitResult(
        improved: true,
        rank: 1,
        score: 128400,
        totalEntries: 42,
      );

      expect(a, equals(b));
    });

    test('inequality when fields differ', () {
      final a = Pix3lLeaderboardSubmitResult(
        improved: true,
        rank: 1,
        totalEntries: 42,
      );
      final b = Pix3lLeaderboardSubmitResult(
        improved: false,
        rank: 2,
        totalEntries: 42,
      );

      expect(a, isNot(equals(b)));
    });

    test('hashCode is consistent with equality', () {
      final a = Pix3lLeaderboardSubmitResult(
        improved: true,
        rank: 1,
        score: 128400,
        totalEntries: 42,
      );
      final b = Pix3lLeaderboardSubmitResult(
        improved: true,
        rank: 1,
        score: 128400,
        totalEntries: 42,
      );

      expect(a.hashCode, equals(b.hashCode));
    });

    test('toString contains all fields', () {
      final result = Pix3lLeaderboardSubmitResult(
        improved: true,
        rank: 1,
        score: 128400,
        timeMs: 92350,
        totalEntries: 42,
      );
      final str = result.toString();

      expect(str, contains('improved: true'));
      expect(str, contains('rank: 1'));
      expect(str, contains('score: 128400'));
      expect(str, contains('timeMs: 92350'));
      expect(str, contains('totalEntries: 42'));
    });
  });

  group('Pix3lLeaderboardEntry', () {
    test('can be instantiated', () {
      expect(
        Pix3lLeaderboardEntry(
          rank: 1,
          score: 128400,
          timeMs: 92350,
          userId: 'user-1',
          playerId: 'player-1',
          username: 'PixelNinja42',
          avatarUrl: 'https://example.com/avatar.png',
          player: Pix3lPlayer(
            id: 'player-1',
            username: 'PixelNinja42',
            avatarUrl: 'https://example.com/avatar.png',
          ),
          createdAt: DateTime(2026, 8, 19),
        ),
        isNotNull,
      );
    });

    test('can be instantiated with null optional fields', () {
      expect(
        Pix3lLeaderboardEntry(
          rank: 1,
          userId: 'user-1',
          playerId: 'player-1',
          username: 'PixelNinja42',
        ),
        isNotNull,
      );
    });

    test('equality', () {
      final a = Pix3lLeaderboardEntry(
        rank: 1,
        score: 128400,
        userId: 'user-1',
        playerId: 'player-1',
        username: 'PixelNinja42',
      );
      final b = Pix3lLeaderboardEntry(
        rank: 1,
        score: 128400,
        userId: 'user-1',
        playerId: 'player-1',
        username: 'PixelNinja42',
      );

      expect(a, equals(b));
    });

    test('toString contains all fields', () {
      final entry = Pix3lLeaderboardEntry(
        rank: 1,
        score: 128400,
        timeMs: 92350,
        userId: 'user-1',
        playerId: 'player-1',
        username: 'PixelNinja42',
        avatarUrl: 'https://example.com/avatar.png',
      );
      final str = entry.toString();

      expect(str, contains('rank: 1'));
      expect(str, contains('user-1'));
      expect(str, contains('player-1'));
      expect(str, contains('PixelNinja42'));
      expect(str, contains('score: 128400'));
      expect(str, contains('timeMs: 92350'));
      expect(str, contains('https://example.com/avatar.png'));
    });
  });

  group('Pix3lLeaderboardTopResult', () {
    test('can be instantiated', () {
      expect(
        Pix3lLeaderboardTopResult(
          key: 'high_score',
          scope: Pix3lLeaderboardScope.all,
          limit: 10,
          offset: 0,
          entries: const [],
        ),
        isNotNull,
      );
    });

    test('equality', () {
      final entry = Pix3lLeaderboardEntry(
        rank: 1,
        score: 128400,
        userId: 'user-1',
        playerId: 'player-1',
        username: 'PixelNinja42',
      );
      final a = Pix3lLeaderboardTopResult(
        key: 'high_score',
        scope: Pix3lLeaderboardScope.all,
        limit: 10,
        offset: 0,
        entries: [entry],
      );
      final b = Pix3lLeaderboardTopResult(
        key: 'high_score',
        scope: Pix3lLeaderboardScope.all,
        limit: 10,
        offset: 0,
        entries: [entry],
      );

      expect(a, equals(b));
    });

    test('toString contains all fields', () {
      final result = Pix3lLeaderboardTopResult(
        key: 'high_score',
        scope: Pix3lLeaderboardScope.all,
        limit: 10,
        offset: 0,
        entries: const [],
      );
      final str = result.toString();

      expect(str, contains('high_score'));
      expect(str, contains('all'));
      expect(str, contains('limit: 10'));
      expect(str, contains('offset: 0'));
    });
  });

  group('Pix3lLeaderboardMyRankResult', () {
    test('can be instantiated', () {
      expect(
        Pix3lLeaderboardMyRankResult(
          rank: 1,
          score: 128400,
          totalEntries: 42,
        ),
        isNotNull,
      );
    });

    test('can be instantiated with a null rank', () {
      expect(
        Pix3lLeaderboardMyRankResult(totalEntries: 42),
        isNotNull,
      );
    });

    test('equality', () {
      final a = Pix3lLeaderboardMyRankResult(
        rank: 1,
        score: 128400,
        totalEntries: 42,
      );
      final b = Pix3lLeaderboardMyRankResult(
        rank: 1,
        score: 128400,
        totalEntries: 42,
      );

      expect(a, equals(b));
    });

    test('toString contains all fields', () {
      final result = Pix3lLeaderboardMyRankResult(
        rank: 1,
        score: 128400,
        totalEntries: 42,
      );
      final str = result.toString();

      expect(str, contains('rank: 1'));
      expect(str, contains('score: 128400'));
      expect(str, contains('totalEntries: 42'));
    });
  });

  group('Pix3lLeaderboardDefinition', () {
    test('can be instantiated', () {
      expect(
        Pix3lLeaderboardDefinition(
          key: 'high_score',
          name: 'High Score',
          boardType: Pix3lLeaderboardType.score,
          primaryMetric: Pix3lLeaderboardPrimaryMetric.score,
        ),
        isNotNull,
      );
    });

    test('equality', () {
      final a = Pix3lLeaderboardDefinition(
        key: 'high_score',
        name: 'High Score',
        boardType: Pix3lLeaderboardType.score,
        primaryMetric: Pix3lLeaderboardPrimaryMetric.score,
      );
      final b = Pix3lLeaderboardDefinition(
        key: 'high_score',
        name: 'High Score',
        boardType: Pix3lLeaderboardType.score,
        primaryMetric: Pix3lLeaderboardPrimaryMetric.score,
      );

      expect(a, equals(b));
    });

    test('toString contains all fields', () {
      final definition = Pix3lLeaderboardDefinition(
        key: 'high_score',
        name: 'High Score',
        boardType: Pix3lLeaderboardType.score,
        primaryMetric: Pix3lLeaderboardPrimaryMetric.score,
      );
      final str = definition.toString();

      expect(str, contains('high_score'));
      expect(str, contains('High Score'));
      expect(str, contains('Pix3lLeaderboardType.score'));
      expect(str, contains('Pix3lLeaderboardPrimaryMetric.score'));
    });
  });
}

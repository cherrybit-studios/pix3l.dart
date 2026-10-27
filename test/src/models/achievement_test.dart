// Tests use non-const constructors to test equality between instances.
// ignore_for_file: prefer_const_constructors

import 'package:pix3l/src/models/achievement.dart';
import 'package:test/test.dart';

void main() {
  group('Pix3lAchievementMode', () {
    test('values match the JS strings', () {
      expect(Pix3lAchievementMode.increment.value, equals('increment'));
      expect(Pix3lAchievementMode.absolute.value, equals('absolute'));
      expect(Pix3lAchievementMode.boolean.value, equals('boolean'));
    });

    test('fromValue returns the matching mode', () {
      expect(
        Pix3lAchievementMode.fromValue('absolute'),
        equals(Pix3lAchievementMode.absolute),
      );
    });
  });

  group('Pix3lAchievement', () {
    test('can be instantiated', () {
      expect(
        Pix3lAchievement(
          key: 'coins_1000',
          title: 'Coin Hoarder',
          description: 'Collect 1000 coins',
          mode: Pix3lAchievementMode.increment,
          target: 1000,
          progress: 1000,
          unlocked: true,
          unlockedAt: DateTime(2026, 10, 27),
          hidden: false,
          iconUrl: 'https://example.com/icon.png',
        ),
        isNotNull,
      );
    });

    test('can be instantiated with null optional fields', () {
      expect(
        Pix3lAchievement(
          key: 'secret_room',
          title: 'Secret Room',
          mode: Pix3lAchievementMode.boolean,
          target: 1,
          progress: 0,
          unlocked: false,
          hidden: true,
        ),
        isNotNull,
      );
    });

    test('equality', () {
      final a = Pix3lAchievement(
        key: 'coins_1000',
        title: 'Coin Hoarder',
        mode: Pix3lAchievementMode.increment,
        target: 1000,
        progress: 250,
        unlocked: false,
        hidden: false,
      );
      final b = Pix3lAchievement(
        key: 'coins_1000',
        title: 'Coin Hoarder',
        mode: Pix3lAchievementMode.increment,
        target: 1000,
        progress: 250,
        unlocked: false,
        hidden: false,
      );

      expect(a, equals(b));
    });

    test('inequality when fields differ', () {
      final a = Pix3lAchievement(
        key: 'coins_1000',
        title: 'Coin Hoarder',
        mode: Pix3lAchievementMode.increment,
        target: 1000,
        progress: 250,
        unlocked: false,
        hidden: false,
      );
      final b = Pix3lAchievement(
        key: 'coins_1000',
        title: 'Coin Hoarder',
        mode: Pix3lAchievementMode.increment,
        target: 1000,
        progress: 1000,
        unlocked: true,
        hidden: false,
      );

      expect(a, isNot(equals(b)));
    });

    test('hashCode is consistent with equality', () {
      final a = Pix3lAchievement(
        key: 'high_score',
        title: 'High Roller',
        mode: Pix3lAchievementMode.absolute,
        target: 100000,
        progress: 42000,
        unlocked: false,
        hidden: false,
      );
      final b = Pix3lAchievement(
        key: 'high_score',
        title: 'High Roller',
        mode: Pix3lAchievementMode.absolute,
        target: 100000,
        progress: 42000,
        unlocked: false,
        hidden: false,
      );

      expect(a.hashCode, equals(b.hashCode));
    });

    test('toString contains all fields', () {
      final achievement = Pix3lAchievement(
        key: 'coins_1000',
        title: 'Coin Hoarder',
        description: 'Collect 1000 coins',
        mode: Pix3lAchievementMode.increment,
        target: 1000,
        progress: 1000,
        unlocked: true,
        unlockedAt: DateTime(2026, 10, 27),
        hidden: false,
        iconUrl: 'https://example.com/icon.png',
      );
      final str = achievement.toString();

      expect(str, contains('key: coins_1000'));
      expect(str, contains('title: Coin Hoarder'));
      expect(str, contains('description: Collect 1000 coins'));
      expect(str, contains('mode: Pix3lAchievementMode.increment'));
      expect(str, contains('target: 1000'));
      expect(str, contains('progress: 1000'));
      expect(str, contains('unlocked: true'));
      expect(str, contains('unlockedAt: 2026-10-27'));
      expect(str, contains('hidden: false'));
      expect(str, contains('iconUrl: https://example.com/icon.png'));
    });
  });
}

// Tests use non-const constructors to test equality between instances.
// ignore_for_file: prefer_const_constructors

import 'package:pix3l/src/models/achievement.dart';
import 'package:test/test.dart';

void main() {
  group('Pix3lAchievement', () {
    test('can be instantiated', () {
      expect(
        Pix3lAchievement(
          id: 'ach-1',
          name: 'First Win',
          description: 'Win your first match.',
          unlocked: false,
        ),
        isNotNull,
      );
    });

    test('equality', () {
      final a = Pix3lAchievement(
        id: 'ach-1',
        name: 'First Win',
        description: 'Win your first match.',
        unlocked: true,
      );
      final b = Pix3lAchievement(
        id: 'ach-1',
        name: 'First Win',
        description: 'Win your first match.',
        unlocked: true,
      );

      expect(a, equals(b));
    });

    test('inequality when unlocked differs', () {
      final a = Pix3lAchievement(
        id: 'ach-1',
        name: 'First Win',
        description: 'Win your first match.',
        unlocked: false,
      );
      final b = Pix3lAchievement(
        id: 'ach-1',
        name: 'First Win',
        description: 'Win your first match.',
        unlocked: true,
      );

      expect(a, isNot(equals(b)));
    });

    test('hashCode is consistent with equality', () {
      final a = Pix3lAchievement(
        id: 'ach-1',
        name: 'First Win',
        description: 'Win your first match.',
        unlocked: true,
      );
      final b = Pix3lAchievement(
        id: 'ach-1',
        name: 'First Win',
        description: 'Win your first match.',
        unlocked: true,
      );

      expect(a.hashCode, equals(b.hashCode));
    });

    test('toString contains all fields', () {
      final achievement = Pix3lAchievement(
        id: 'ach-1',
        name: 'First Win',
        description: 'Win your first match.',
        unlocked: true,
      );
      final str = achievement.toString();

      expect(str, contains('ach-1'));
      expect(str, contains('First Win'));
      expect(str, contains('Win your first match.'));
      expect(str, contains('true'));
    });
  });
}

// Tests use non-const constructors to test equality between instances.
// ignore_for_file: prefer_const_constructors

import 'package:pix3l/src/models/player.dart';
import 'package:test/test.dart';

void main() {
  group('Pix3lPlayer', () {
    test('can be instantiated', () {
      expect(
        Pix3lPlayer(
          id: 'player-1',
          username: 'Alice',
          avatarUrl: 'https://example.com/avatar.png',
        ),
        isNotNull,
      );
    });

    test('can be instantiated with null fields', () {
      expect(
        Pix3lPlayer(id: 'player-1'),
        isNotNull,
      );
    });

    test('equality', () {
      final a = Pix3lPlayer(
        id: 'player-1',
        username: 'Alice',
        avatarUrl: 'https://example.com/avatar.png',
      );
      final b = Pix3lPlayer(
        id: 'player-1',
        username: 'Alice',
        avatarUrl: 'https://example.com/avatar.png',
      );

      expect(a, equals(b));
    });

    test('inequality when fields differ', () {
      final a = Pix3lPlayer(
        id: 'player-1',
        username: 'Alice',
        avatarUrl: 'https://example.com/avatar.png',
      );
      final b = Pix3lPlayer(
        id: 'player-2',
        username: 'Bob',
        avatarUrl: 'https://example.com/bob.png',
      );

      expect(a, isNot(equals(b)));
    });

    test('hashCode is consistent with equality', () {
      final a = Pix3lPlayer(
        id: 'player-1',
        username: 'Alice',
        avatarUrl: 'https://example.com/avatar.png',
      );
      final b = Pix3lPlayer(
        id: 'player-1',
        username: 'Alice',
        avatarUrl: 'https://example.com/avatar.png',
      );

      expect(a.hashCode, equals(b.hashCode));
    });

    test('toString contains all fields', () {
      final player = Pix3lPlayer(
        id: 'player-1',
        username: 'Alice',
        avatarUrl: 'https://example.com/avatar.png',
      );
      final str = player.toString();

      expect(str, contains('player-1'));
      expect(str, contains('Alice'));
      expect(str, contains('https://example.com/avatar.png'));
    });
  });
}

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
          displayName: 'Alice',
          walletAddress: '0xABC',
        ),
        isNotNull,
      );
    });

    test('equality', () {
      final a = Pix3lPlayer(
        id: 'player-1',
        displayName: 'Alice',
        walletAddress: '0xABC',
      );
      final b = Pix3lPlayer(
        id: 'player-1',
        displayName: 'Alice',
        walletAddress: '0xABC',
      );

      expect(a, equals(b));
    });

    test('inequality when fields differ', () {
      final a = Pix3lPlayer(
        id: 'player-1',
        displayName: 'Alice',
        walletAddress: '0xABC',
      );
      final b = Pix3lPlayer(
        id: 'player-2',
        displayName: 'Bob',
        walletAddress: '0xDEF',
      );

      expect(a, isNot(equals(b)));
    });

    test('hashCode is consistent with equality', () {
      final a = Pix3lPlayer(
        id: 'player-1',
        displayName: 'Alice',
        walletAddress: '0xABC',
      );
      final b = Pix3lPlayer(
        id: 'player-1',
        displayName: 'Alice',
        walletAddress: '0xABC',
      );

      expect(a.hashCode, equals(b.hashCode));
    });

    test('toString contains all fields', () {
      final player = Pix3lPlayer(
        id: 'player-1',
        displayName: 'Alice',
        walletAddress: '0xABC',
      );
      final str = player.toString();

      expect(str, contains('player-1'));
      expect(str, contains('Alice'));
      expect(str, contains('0xABC'));
    });
  });
}

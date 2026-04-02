// Tests use non-const constructors to test equality between instances.
// ignore_for_file: prefer_const_constructors

import 'package:pix3l/src/models/asset.dart';
import 'package:test/test.dart';

void main() {
  group('Pix3lAsset', () {
    test('can be instantiated', () {
      expect(
        Pix3lAsset(
          id: 'asset-1',
          name: 'Magic Sword',
          description: 'A powerful sword.',
          imageUri: 'https://example.com/sword.png',
        ),
        isNotNull,
      );
    });

    test('equality', () {
      final a = Pix3lAsset(
        id: 'asset-1',
        name: 'Magic Sword',
        description: 'A powerful sword.',
        imageUri: 'https://example.com/sword.png',
      );
      final b = Pix3lAsset(
        id: 'asset-1',
        name: 'Magic Sword',
        description: 'A powerful sword.',
        imageUri: 'https://example.com/sword.png',
      );

      expect(a, equals(b));
    });

    test('inequality when id differs', () {
      final a = Pix3lAsset(
        id: 'asset-1',
        name: 'Magic Sword',
        description: 'A powerful sword.',
        imageUri: 'https://example.com/sword.png',
      );
      final b = Pix3lAsset(
        id: 'asset-2',
        name: 'Magic Sword',
        description: 'A powerful sword.',
        imageUri: 'https://example.com/sword.png',
      );

      expect(a, isNot(equals(b)));
    });

    test('hashCode is consistent with equality', () {
      final a = Pix3lAsset(
        id: 'asset-1',
        name: 'Magic Sword',
        description: 'A powerful sword.',
        imageUri: 'https://example.com/sword.png',
      );
      final b = Pix3lAsset(
        id: 'asset-1',
        name: 'Magic Sword',
        description: 'A powerful sword.',
        imageUri: 'https://example.com/sword.png',
      );

      expect(a.hashCode, equals(b.hashCode));
    });

    test('toString contains all fields', () {
      final asset = Pix3lAsset(
        id: 'asset-1',
        name: 'Magic Sword',
        description: 'A powerful sword.',
        imageUri: 'https://example.com/sword.png',
      );
      final str = asset.toString();

      expect(str, contains('asset-1'));
      expect(str, contains('Magic Sword'));
      expect(str, contains('A powerful sword.'));
      expect(str, contains('https://example.com/sword.png'));
    });
  });
}

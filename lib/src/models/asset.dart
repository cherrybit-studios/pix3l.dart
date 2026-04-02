import 'package:meta/meta.dart';

/// Represents a digital asset (NFT) in the PIX3L SDK.
@immutable
class Pix3lAsset {
  /// Creates a [Pix3lAsset] with the provided fields.
  const Pix3lAsset({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUri,
  });

  /// The unique identifier of the asset.
  final String id;

  /// The display name of the asset.
  final String name;

  /// A description of the asset.
  final String description;

  /// A URI pointing to the asset's metadata or image.
  final String imageUri;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pix3lAsset &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          imageUri == other.imageUri;

  @override
  int get hashCode => Object.hash(id, name, description, imageUri);

  @override
  String toString() =>
      'Pix3lAsset(id: $id, name: $name, '
      'description: $description, imageUri: $imageUri)';
}

import 'dart:js_interop';

import 'package:pix3l/src/js/pix3l_js.dart';
import 'package:pix3l/src/models/asset.dart';

/// Provides access to the PIX3L SDK digital assets API.
///
/// Use this class to query a player's on-chain asset inventory and to grant
/// or transfer assets.
class Pix3lAssets {
  /// Creates a [Pix3lAssets] instance backed by the given JS module.
  const Pix3lAssets(this._js);

  final JSPix3lAssets _js;

  /// Returns the current player's digital asset inventory.
  Future<List<Pix3lAsset>> getInventory() async {
    final jsAssets = await _js.getInventory().toDart;
    return [
      for (var i = 0; i < jsAssets.length; i++) _toAsset(jsAssets[i]),
    ];
  }

  /// Grants the asset identified by [assetId] to the current player.
  Future<void> grant(String assetId) async {
    await _js.grant(assetId.toJS).toDart;
  }

  /// Transfers the asset identified by [assetId] to the player identified by
  /// [toPlayerId].
  Future<void> transfer({
    required String assetId,
    required String toPlayerId,
  }) async {
    await _js.transfer(assetId.toJS, toPlayerId.toJS).toDart;
  }

  Pix3lAsset _toAsset(JSPix3lAsset js) => Pix3lAsset(
    id: js.id.toDart,
    name: js.name.toDart,
    description: js.description.toDart,
    imageUri: js.imageUri.toDart,
  );
}

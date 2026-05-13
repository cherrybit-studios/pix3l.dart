import 'dart:js_interop';

import 'package:pix3l/src/js/pix3l_input_js.dart';
import 'package:pix3l/src/js/pix3l_js.dart';
import 'package:pix3l/src/models/gamepad.dart';

export 'package:pix3l/src/models/gamepad.dart';

/// A Dart wrapper for the PIX3L JavaScript SDK gamepad input API.
///
/// Accessed via `Pix3l.input` or used directly:
///
/// ```dart
/// final controllers = Pix3l.input.getControllers();
/// final pad = Pix3l.input.getController();
///
/// if (pad != null) {
///   if (pad.buttons.a.justPressed) {
///     player.jump();
///   }
/// }
/// ```
class Pix3lInput {
  /// Creates an instance of [Pix3lInput].
  ///
  /// Typically accessed via `Pix3l.input` rather than constructed directly.
  Pix3lInput();

  final JSPix3lInput _sdk = PIX3L.input;

  /// Returns all currently connected and normalized controllers.
  List<Pix3lController> getControllers() {
    return _sdk.getControllers().toDart.map(_toDartController).toList();
  }

  /// Returns a single normalized controller by [index], or null if not
  /// connected.
  Pix3lController? getController([int index = 0]) {
    final jsController = _sdk.getController(index.toJS);
    if (jsController == null) return null;
    return _toDartController(jsController);
  }

  /// Returns `true` if at least one controller with standard mapping is
  /// connected.
  bool isSupported() {
    return _sdk.isSupported().toDart;
  }

  /// Subscribes to controller state changes.
  ///
  /// The [callback] is invoked whenever any controller's input changes.
  /// Returns a function that can be called to unsubscribe.
  void Function() onChange(void Function(List<Pix3lController>) callback) {
    final jsCallback = (JSArray<JSPix3lController> controllers) {
      callback(controllers.toDart.map(_toDartController).toList());
    }.toJS;
    final unsub = _sdk.onChange(jsCallback);
    return () {
      unsub.callAsFunction();
    };
  }

  static Pix3lController _toDartController(JSPix3lController js) {
    return Pix3lController(
      index: js.index.toDartInt,
      id: js.id.toDart,
      supported: js.supported.toDart,
      buttons: _toDartButtons(js.buttons),
      sticks: _toDartSticks(js.sticks),
      triggers: _toDartTriggers(js.triggers),
    );
  }

  static Pix3lButtons _toDartButtons(JSPix3lButtons js) {
    return Pix3lButtons(
      a: _toDartButtonState(js.a),
      b: _toDartButtonState(js.b),
      x: _toDartButtonState(js.x),
      y: _toDartButtonState(js.y),
      lb: _toDartButtonState(js.lb),
      rb: _toDartButtonState(js.rb),
      lt: _toDartButtonState(js.lt),
      rt: _toDartButtonState(js.rt),
      ls: _toDartButtonState(js.ls),
      rs: _toDartButtonState(js.rs),
      back: _toDartButtonState(js.back),
      start: _toDartButtonState(js.start),
      home: _toDartButtonState(js.home),
      dpadUp: _toDartButtonState(js.dpadUp),
      dpadDown: _toDartButtonState(js.dpadDown),
      dpadLeft: _toDartButtonState(js.dpadLeft),
      dpadRight: _toDartButtonState(js.dpadRight),
    );
  }

  static Pix3lButtonState _toDartButtonState(JSPix3lButtonState? js) {
    if (js == null) {
      return const Pix3lButtonState(
        pressed: false,
        justPressed: false,
        justReleased: false,
      );
    }
    return Pix3lButtonState(
      pressed: js.pressed.toDart,
      justPressed: js.justPressed.toDart,
      justReleased: js.justReleased.toDart,
    );
  }

  static Pix3lSticks _toDartSticks(JSPix3lSticks js) {
    return Pix3lSticks(
      left: Pix3lStick(
        x: js.left.x.toDartDouble,
        y: js.left.y.toDartDouble,
      ),
      right: Pix3lStick(
        x: js.right.x.toDartDouble,
        y: js.right.y.toDartDouble,
      ),
    );
  }

  static Pix3lTriggers _toDartTriggers(JSPix3lTriggers js) {
    return Pix3lTriggers(
      lt: Pix3lTrigger(value: js.lt.value.toDartDouble),
      rt: Pix3lTrigger(value: js.rt.value.toDartDouble),
    );
  }
}

import 'dart:js_interop';

/// The PIX3L input API exposed via `PIX3L.input`.
@JS()
extension type JSPix3lInput._(JSObject _) implements JSObject {
  /// Returns an array of all currently connected and normalized controllers.
  external JSArray<JSPix3lController> getControllers();

  /// Returns a single normalized controller by index, or null if not connected.
  external JSPix3lController? getController([JSNumber? index]);

  /// Returns true if at least one controller with standard mapping is
  /// connected.
  external JSBoolean isSupported();

  /// Subscribes to controller state changes.
  /// Returns an unsubscribe function.
  external JSFunction onChange(JSFunction callback);
}

/// A normalized gamepad controller returned by the PIX3L SDK.
@JS()
extension type JSPix3lController._(JSObject _) implements JSObject {
  /// The controller index.
  external JSNumber get index;

  /// The controller identifier string.
  external JSString get id;

  /// Whether this controller uses a standard mapping.
  external JSBoolean get supported;

  /// The button states.
  external JSPix3lButtons get buttons;

  /// The stick states.
  external JSPix3lSticks get sticks;

  /// The trigger states.
  external JSPix3lTriggers get triggers;
}

/// Button states exposed by a PIX3L normalized controller.
@JS()
extension type JSPix3lButtons._(JSObject _) implements JSObject {
  /// The A / Cross button state.
  external JSPix3lButtonState? get a;

  /// The B / Circle button state.
  external JSPix3lButtonState? get b;

  /// The X / Square button state.
  external JSPix3lButtonState? get x;

  /// The Y / Triangle button state.
  external JSPix3lButtonState? get y;

  /// The left bumper / L1 button state.
  external JSPix3lButtonState? get lb;

  /// The right bumper / R1 button state.
  external JSPix3lButtonState? get rb;

  /// The left trigger as a digital button state.
  external JSPix3lButtonState? get lt;

  /// The right trigger as a digital button state.
  external JSPix3lButtonState? get rt;

  /// The left stick click / L3 button state.
  external JSPix3lButtonState? get ls;

  /// The right stick click / R3 button state.
  external JSPix3lButtonState? get rs;

  /// The back / select / share button state.
  external JSPix3lButtonState? get back;

  /// The start / menu button state.
  external JSPix3lButtonState? get start;

  /// The home / guide button state.
  external JSPix3lButtonState? get home;

  /// The D-pad up button state.
  external JSPix3lButtonState? get dpadUp;

  /// The D-pad down button state.
  external JSPix3lButtonState? get dpadDown;

  /// The D-pad left button state.
  external JSPix3lButtonState? get dpadLeft;

  /// The D-pad right button state.
  external JSPix3lButtonState? get dpadRight;
}

/// State of a single button on a PIX3L normalized controller.
@JS()
extension type JSPix3lButtonState._(JSObject _) implements JSObject {
  /// Whether the button is currently held down.
  external JSBoolean get pressed;

  /// Whether the button was pressed this frame (edge detection).
  external JSBoolean get justPressed;

  /// Whether the button was released this frame.
  external JSBoolean get justReleased;
}

/// Stick states exposed by a PIX3L normalized controller.
@JS()
extension type JSPix3lSticks._(JSObject _) implements JSObject {
  /// The left stick state.
  external JSPix3lStick get left;

  /// The right stick state.
  external JSPix3lStick get right;
}

/// A single analog stick on a PIX3L normalized controller.
@JS()
extension type JSPix3lStick._(JSObject _) implements JSObject {
  /// Horizontal axis, -1.0 (left) to 1.0 (right).
  external JSNumber get x;

  /// Vertical axis, -1.0 (down) to 1.0 (up).
  external JSNumber get y;
}

/// Trigger states exposed by a PIX3L normalized controller.
@JS()
extension type JSPix3lTriggers._(JSObject _) implements JSObject {
  /// The left trigger state.
  external JSPix3lTrigger get lt;

  /// The right trigger state.
  external JSPix3lTrigger get rt;
}

/// A single trigger on a PIX3L normalized controller.
@JS()
extension type JSPix3lTrigger._(JSObject _) implements JSObject {
  /// Trigger pressure, 0.0 (released) to 1.0 (fully pressed).
  external JSNumber get value;
}

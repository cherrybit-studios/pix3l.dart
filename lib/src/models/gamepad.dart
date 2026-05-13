import 'package:meta/meta.dart';

/// Represents a normalized gamepad controller from the PIX3L SDK.
@immutable
class Pix3lController {
  /// Creates a [Pix3lController] with the provided fields.
  const Pix3lController({
    required this.index,
    required this.id,
    required this.supported,
    required this.buttons,
    required this.sticks,
    required this.triggers,
  });

  /// The controller index.
  final int index;

  /// The controller identifier string.
  final String id;

  /// Whether this controller uses a standard mapping.
  final bool supported;

  /// The button states.
  final Pix3lButtons buttons;

  /// The stick states.
  final Pix3lSticks sticks;

  /// The trigger states.
  final Pix3lTriggers triggers;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pix3lController &&
          index == other.index &&
          id == other.id &&
          supported == other.supported &&
          buttons == other.buttons &&
          sticks == other.sticks &&
          triggers == other.triggers;

  @override
  int get hashCode =>
      Object.hash(index, id, supported, buttons, sticks, triggers);

  @override
  String toString() =>
      'Pix3lController(index: $index, id: $id, supported: $supported, '
      'buttons: $buttons, sticks: $sticks, triggers: $triggers)';
}

/// Represents the state of all buttons on a PIX3L controller.
@immutable
class Pix3lButtons {
  /// Creates a [Pix3lButtons] with the provided fields.
  const Pix3lButtons({
    required this.a,
    required this.b,
    required this.x,
    required this.y,
    required this.lb,
    required this.rb,
    required this.lt,
    required this.rt,
    required this.ls,
    required this.rs,
    required this.back,
    required this.start,
    required this.home,
    required this.dpadUp,
    required this.dpadDown,
    required this.dpadLeft,
    required this.dpadRight,
  });

  /// The A / Cross button state.
  final Pix3lButtonState a;

  /// The B / Circle button state.
  final Pix3lButtonState b;

  /// The X / Square button state.
  final Pix3lButtonState x;

  /// The Y / Triangle button state.
  final Pix3lButtonState y;

  /// The left bumper / L1 button state.
  final Pix3lButtonState lb;

  /// The right bumper / R1 button state.
  final Pix3lButtonState rb;

  /// The left trigger as a digital button state.
  final Pix3lButtonState lt;

  /// The right trigger as a digital button state.
  final Pix3lButtonState rt;

  /// The left stick click / L3 button state.
  final Pix3lButtonState ls;

  /// The right stick click / R3 button state.
  final Pix3lButtonState rs;

  /// The back / select / share button state.
  final Pix3lButtonState back;

  /// The start / menu button state.
  final Pix3lButtonState start;

  /// The home / guide button state.
  final Pix3lButtonState home;

  /// The D-pad up button state.
  final Pix3lButtonState dpadUp;

  /// The D-pad down button state.
  final Pix3lButtonState dpadDown;

  /// The D-pad left button state.
  final Pix3lButtonState dpadLeft;

  /// The D-pad right button state.
  final Pix3lButtonState dpadRight;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pix3lButtons &&
          a == other.a &&
          b == other.b &&
          x == other.x &&
          y == other.y &&
          lb == other.lb &&
          rb == other.rb &&
          lt == other.lt &&
          rt == other.rt &&
          ls == other.ls &&
          rs == other.rs &&
          back == other.back &&
          start == other.start &&
          home == other.home &&
          dpadUp == other.dpadUp &&
          dpadDown == other.dpadDown &&
          dpadLeft == other.dpadLeft &&
          dpadRight == other.dpadRight;

  @override
  int get hashCode => Object.hash(
    a,
    b,
    x,
    y,
    lb,
    rb,
    lt,
    rt,
    ls,
    rs,
    back,
    start,
    home,
    dpadUp,
    dpadDown,
    dpadLeft,
    dpadRight,
  );

  @override
  String toString() =>
      'Pix3lButtons(a: $a, b: $b, x: $x, y: $y, lb: $lb, rb: $rb, '
      'lt: $lt, rt: $rt, ls: $ls, rs: $rs, back: $back, start: $start, '
      'home: $home, dpadUp: $dpadUp, dpadDown: $dpadDown, '
      'dpadLeft: $dpadLeft, dpadRight: $dpadRight)';
}

/// Represents the state of a single button on a PIX3L controller.
@immutable
class Pix3lButtonState {
  /// Creates a [Pix3lButtonState] with the provided fields.
  const Pix3lButtonState({
    required this.pressed,
    required this.justPressed,
    required this.justReleased,
  });

  /// Whether the button is currently held down.
  final bool pressed;

  /// Whether the button was pressed this frame (edge detection).
  final bool justPressed;

  /// Whether the button was released this frame.
  final bool justReleased;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pix3lButtonState &&
          pressed == other.pressed &&
          justPressed == other.justPressed &&
          justReleased == other.justReleased;

  @override
  int get hashCode => Object.hash(pressed, justPressed, justReleased);

  @override
  String toString() =>
      'Pix3lButtonState(pressed: $pressed, justPressed: $justPressed, '
      'justReleased: $justReleased)';
}

/// Represents the state of both analog sticks on a PIX3L controller.
@immutable
class Pix3lSticks {
  /// Creates a [Pix3lSticks] with the provided fields.
  const Pix3lSticks({
    required this.left,
    required this.right,
  });

  /// The left stick state.
  final Pix3lStick left;

  /// The right stick state.
  final Pix3lStick right;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pix3lSticks && left == other.left && right == other.right;

  @override
  int get hashCode => Object.hash(left, right);

  @override
  String toString() => 'Pix3lSticks(left: $left, right: $right)';
}

/// Represents a single analog stick on a PIX3L controller.
@immutable
class Pix3lStick {
  /// Creates a [Pix3lStick] with the provided fields.
  const Pix3lStick({
    required this.x,
    required this.y,
  });

  /// Horizontal axis, -1.0 (left) to 1.0 (right).
  final double x;

  /// Vertical axis, -1.0 (down) to 1.0 (up).
  final double y;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pix3lStick && x == other.x && y == other.y;

  @override
  int get hashCode => Object.hash(x, y);

  @override
  String toString() => 'Pix3lStick(x: $x, y: $y)';
}

/// Represents the state of both triggers on a PIX3L controller.
@immutable
class Pix3lTriggers {
  /// Creates a [Pix3lTriggers] with the provided fields.
  const Pix3lTriggers({
    required this.lt,
    required this.rt,
  });

  /// The left trigger state.
  final Pix3lTrigger lt;

  /// The right trigger state.
  final Pix3lTrigger rt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pix3lTriggers && lt == other.lt && rt == other.rt;

  @override
  int get hashCode => Object.hash(lt, rt);

  @override
  String toString() => 'Pix3lTriggers(lt: $lt, rt: $rt)';
}

/// Represents a single trigger on a PIX3L controller.
@immutable
class Pix3lTrigger {
  /// Creates a [Pix3lTrigger] with the provided fields.
  const Pix3lTrigger({
    required this.value,
  });

  /// Trigger pressure, 0.0 (released) to 1.0 (fully pressed).
  final double value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Pix3lTrigger && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Pix3lTrigger(value: $value)';
}

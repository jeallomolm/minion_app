import 'package:flutter/cupertino.dart';

class BG {
  static BoxDecoration bgDecoration(double color) {
    return BoxDecoration(
      gradient: LinearGradient(colors: [
        HSLColor.fromAHSL(1.0, color, 1.0, 0.4).toColor(),
        HSLColor.fromAHSL(1.0, color + 15, 1.0, 0.6).toColor(),
        HSLColor.fromAHSL(1.0, color + 15, 1.0, 0.75).toColor(),
      ], transform: GradientRotation(-3.14 / 4)),
    );
  }
}

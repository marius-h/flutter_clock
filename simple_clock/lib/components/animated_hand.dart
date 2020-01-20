import 'package:flutter/material.dart';
import 'package:simple_clock/components/drawn_hand.dart';
import 'package:simple_clock/styles/style.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

final radiansPerTick = radians(360 / 60);

class AnimatedHand extends AnimatedWidget {
  AnimatedHand({@required Animation<double> animation, Key key})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    return DrawnHand(
      color: Style.darkTheme.primaryColor,
      size: 1,
      thickness: 4,
      angleRadians: animation.value * radiansPerTick,
    );
  }
}
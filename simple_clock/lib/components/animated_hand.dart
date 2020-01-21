import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_clock/components/drawn_hand.dart';
import 'package:simple_clock/styles/style_provider.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

final radiansPerTick = radians(360 / 60);

class AnimatedHand extends AnimatedWidget {
  AnimatedHand({@required Animation<double> animation, this.color, Key key})
      : super(key: key, listenable: animation);

  final Color color;

  @override
  Widget build(BuildContext context) {
    final styleProvider = Provider.of<StyleProvider>(context);
    final animation = listenable as Animation<double>;

    return DrawnHand(
      color: styleProvider.getThemeData.primaryColor,
      size: 1,
      thickness: 4,
      angleRadians: animation.value * radiansPerTick,
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_clock/services/number_change_listener.dart';
import 'package:simple_clock/states/clock_state.dart';
import 'package:simple_clock/components/drawn_hand.dart';
import 'package:simple_clock/styles/style.dart';
import 'package:tuple/tuple.dart';
import 'package:vector_math/vector_math_64.dart' show radians;
import 'package:provider/provider.dart';

final radiansPerTick = radians(360 / 60);

class MiniClock extends StatefulWidget {
  MiniClock({@required this.index, Key key}) : super(key: key);

  final int index;

  @override
  _MiniClockState createState() => _MiniClockState();
}

class _MiniClockState extends State<MiniClock> {
  Duration _duration = Duration(seconds: 1, milliseconds: 500);

  Tuple2<double, double> beginState = ClockState.idle;
  Tuple2<double, double> endState;

  @override
  Widget build(BuildContext context) {
    final Tuple2<double, double> newState =
        Provider.of<NumberChangeListener>(context).clockState[widget.index];

    if (widget.index == 1) {
      print('${beginState.item1} + ${newState.item1}');
    }

    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.all(Radius.circular(80)),
            ),
          ),
          TweenAnimationBuilder<double>(
            tween: Tween<double>(
                begin: beginState.item1, end: newState.item1),
            duration: _duration,
            onEnd: () => beginState = Tuple2(newState.item1, newState.item2),
            builder: (BuildContext context, double value, Widget child) {
              return DrawnHand(
                color: Style.darkTheme.primaryColor,
                size: 1,
                thickness: 4,
                angleRadians: value * radiansPerTick,
              );
            },
          ),
          TweenAnimationBuilder<double>(
            tween: Tween<double>(
                begin: beginState.item2, end: newState.item2),
            duration: _duration,
            onEnd: () => beginState = Tuple2(newState.item1, newState.item2),
            builder: (BuildContext context, double value, Widget child) {
              return DrawnHand(
                color: Style.darkTheme.primaryColor,
                size: 1,
                thickness: 4,
                angleRadians: value * radiansPerTick,
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_clock/components/animated_hand.dart';
import 'package:simple_clock/services/number_change_listener.dart';
import 'package:tuple/tuple.dart';

class MiniClock extends StatefulWidget {
  MiniClock({Key key}) : super(key: key);

  @override
  _MiniClockState createState() => _MiniClockState();
}

class _MiniClockState extends State<MiniClock> with TickerProviderStateMixin {
  final Duration _duration = const Duration(seconds: 2);
  final int repetitions = 3;
  final Cubic customEase = Cubic(0.2, 0.0, 0.8, 1.0);

  AnimationController _firstHandController;
  AnimationController _secondHandController;
  Animation<double> _firstHandAnimation;
  Animation<double> _secondHandAnimation;

  @override
  void initState() {
    super.initState();

    _firstHandController = AnimationController(
      duration: _duration * repetitions,
      vsync: this,
    );
    _secondHandController = AnimationController(
      duration: _duration * repetitions,
      vsync: this,
    );
  }

  void initAnimations(
      Tuple2<double, double> oldState, Tuple2<double, double> newState) {
    _firstHandController.reset();
    double firstHandDifference = newState.item1 <= oldState.item1
        ? 60 - oldState.item1 + newState.item1
        : newState.item1;
    _firstHandAnimation = Tween<double>(
      begin: oldState.item1,
      end: oldState.item1 + repetitions * 60 + firstHandDifference,
    ).animate(
      CurvedAnimation(
        parent: _firstHandController,
        curve: customEase,
      ),
    );
    _firstHandController.forward();

    _secondHandController.reset();
    double secondHandDifference = newState.item2 > oldState.item2
        ? newState.item2
        : 60 - oldState.item2 + newState.item2;
    _secondHandAnimation = Tween<double>(
      begin: oldState.item2,
      end: oldState.item2 - repetitions * 60 + secondHandDifference,
    ).animate(
      CurvedAnimation(
        parent: _secondHandController,
        curve: customEase,
      ),
    );
    _secondHandController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final Tuple2<double, double> oldState = Provider.of<ClockStateListener>(context).oldState;
    final Tuple2<double, double> newState = Provider.of<ClockStateListener>(context).newState;

    print('build MiniClock with $oldState and $newState');

    initAnimations(oldState, newState);

    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.all(Radius.circular(80)),
            ),
          ),
          AnimatedHand(animation: _firstHandAnimation),
          AnimatedHand(animation: _secondHandAnimation),
        ],
      ),
    );
  }
}

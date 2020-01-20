import 'package:flutter/material.dart';
import 'package:simple_clock/states/clock_state.dart';
import 'package:tuple/tuple.dart';

class ClockStateListener with ChangeNotifier {
  Tuple2<double,double> newState = ClockState.idle;
  Tuple2<double,double> oldState = ClockState.idle;

  void setClockState(Tuple2<double,double> state) {
    oldState = newState;
    newState = state;
    notifyListeners();
  }
}

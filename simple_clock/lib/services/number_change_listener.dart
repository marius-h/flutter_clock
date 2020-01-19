import 'package:flutter/material.dart';
import 'package:simple_clock/states/clock_state.dart';
import 'package:tuple/tuple.dart';

class NumberChangeListener with ChangeNotifier {
  Tuple2<double,double> newState = ClockState.idle;
  Tuple2<double,double> oldState = ClockState.idle;


  void setNumber(int number) {
    switch(number){
      case 2:
        ;
        break;
    }
    notifyListeners();
  }
}

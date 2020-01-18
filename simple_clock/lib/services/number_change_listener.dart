import 'package:flutter/material.dart';
import 'package:simple_clock/states/clock_state.dart';
import 'package:tuple/tuple.dart';

class NumberChangeListener with ChangeNotifier {
  List<Tuple2<double, double>> clockState = [
    ClockState.idle,
    ClockState.idle,
    ClockState.idle,
    ClockState.idle,
    ClockState.idle,
    ClockState.idle
  ];

  void setNumber(int number) {
   switch (number) {
      case -1:
         clockState = [
      ClockState.reset,
      ClockState.reset,
      ClockState.reset,
      ClockState.reset,
      ClockState.reset,
      ClockState.reset
    ];
    break;
      case 0:
        clockState = [
          ClockState.south_east,
          ClockState.south_west,
          ClockState.north_south,
          ClockState.north_south,
          ClockState.north_east,
          ClockState.north_west
        ];
        break;
      case 1:
        clockState = [
          ClockState.idle,
          ClockState.south_south,
          ClockState.idle,
          ClockState.north_south,
          ClockState.idle,
          ClockState.north_north
        ];
        break;
      case 2:
        clockState = [
          ClockState.east_east,
          ClockState.south_west,
          ClockState.south_east,
          ClockState.north_west,
          ClockState.north_east,
          ClockState.west_west
        ];
        break;
      case 3:
        clockState = [
          ClockState.east_east,
          ClockState.south_west,
          ClockState.east_east,
          ClockState.north_west,
          ClockState.east_east,
          ClockState.north_west
        ];
        break;
      case 4:
        clockState = [
          ClockState.south_south,
          ClockState.south_south,
          ClockState.north_east,
          ClockState.north_south,
          ClockState.idle,
          ClockState.north_north
        ];
        break;
      case 5:
        clockState = [
          ClockState.south_east,
          ClockState.west_west,
          ClockState.north_east,
          ClockState.south_west,
          ClockState.east_east,
          ClockState.north_west
        ];
        break;
      case 6:
        clockState = [
          ClockState.south_east,
          ClockState.west_west,
          ClockState.north_south,
          ClockState.south_west,
          ClockState.north_east,
          ClockState.north_west
        ];
        break;
      case 7:
        clockState = [
          ClockState.east_east,
          ClockState.south_west,
          ClockState.idle,
          ClockState.north_south,
          ClockState.idle,
          ClockState.north_north
        ];
        break;
      case 8:
        clockState = [
          ClockState.south_east,
          ClockState.south_west,
          ClockState.north_east,
          ClockState.south_west,
          ClockState.north_east,
          ClockState.north_west
        ];
        break;
      case 9:
        clockState = [
          ClockState.south_east,
          ClockState.south_west,
          ClockState.north_east,
          ClockState.north_south,
          ClockState.east_east,
          ClockState.north_west
        ];
        break;
    }

    notifyListeners();
  }
}

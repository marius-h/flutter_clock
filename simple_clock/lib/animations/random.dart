import 'dart:math';

import 'package:simple_clock/states/clock_state.dart';
import 'package:tuple/tuple.dart';

// random mini clocks are getting animated
List<List<Tuple2<double, double>>> random(List<List<Tuple2<double, double>>> grid){
  for (int i = 0; i < 10; i++)
    grid[Random().nextInt(grid.length)][Random().nextInt(grid[0].length)] = ClockState.reset;
  return grid;
}
import 'dart:math';

import 'package:simple_clock/states/clock_state.dart';
import 'package:tuple/tuple.dart';

// all 4 digits from 0 to 9 + reset
List<List<Tuple2<double, double>>> buildDigit(
    int digit, Point origin, List<List<Tuple2<double, double>>> grid) {
  List<List<Tuple2<double, double>>> pixels;

  switch (digit) {
    case -1:
      // Temp
      pixels = [
        [ClockState.south_east, ClockState.north_east, ClockState.idle],
        [ClockState.south_west, ClockState.north_west, ClockState.idle],
      ];
      break;
    case 0:
      pixels = [
        [ClockState.south_east, ClockState.north_south, ClockState.north_east],
        [ClockState.south_west, ClockState.north_south, ClockState.north_west],
      ];
      break;
    case 1:
      pixels = [
        [ClockState.idle, ClockState.idle, ClockState.idle],
        [
          ClockState.south_south,
          ClockState.north_south,
          ClockState.north_north
        ],
      ];
      break;
    case 2:
      pixels = [
        [ClockState.east_east, ClockState.south_east, ClockState.north_east],
        [ClockState.south_west, ClockState.north_west, ClockState.west_west],
      ];
      break;
    case 3:
      pixels = [
        [ClockState.east_east, ClockState.east_east, ClockState.east_east],
        [ClockState.south_west, ClockState.north_west, ClockState.north_west],
      ];
      break;
    case 4:
      pixels = [
        [ClockState.south_south, ClockState.north_east, ClockState.idle],
        [
          ClockState.south_south,
          ClockState.north_south,
          ClockState.north_north
        ],
      ];
      break;
    case 5:
      pixels = [
        [ClockState.south_east, ClockState.north_east, ClockState.east_east],
        [ClockState.west_west, ClockState.south_west, ClockState.north_west],
      ];
      break;
    case 6:
      pixels = [
        [ClockState.south_east, ClockState.north_south, ClockState.north_east],
        [ClockState.west_west, ClockState.south_west, ClockState.north_west],
      ];
      break;
    case 7:
      pixels = [
        [ClockState.east_east, ClockState.idle, ClockState.idle],
        [ClockState.south_west, ClockState.north_south, ClockState.north_north],
      ];
      break;
    case 8:
      pixels = [
        [ClockState.south_east, ClockState.north_east, ClockState.north_east],
        [ClockState.south_west, ClockState.south_west, ClockState.north_west],
      ];
      break;
    case 9:
      pixels = [
        [ClockState.south_east, ClockState.north_east, ClockState.idle],
        [ClockState.south_west, ClockState.north_south, ClockState.north_north],
      ];
      break;
  }

  return _moveToPoint(pixels, origin, grid);
}

List<List<Tuple2<double, double>>> _moveToPoint(
    List<List<Tuple2<double, double>>> pixels,
    Point origin,
    List<List<Tuple2<double, double>>> grid) {
  for (var i = 0; i < pixels.length; ++i) {
    for (var j = 0; j < pixels[i].length; ++j) {
      var o = pixels[i][j];
      grid[origin.x + i][origin.y + j] = o;
    }
  }
  return grid;
}
